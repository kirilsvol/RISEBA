# Bibliotēku ielāde ####
library(tidyverse)
library(skimr)
library(lubridate)
library(data.table)

# Datu ielāde ####
data <- read.csv("C:/Users/smilicat/Desktop/Kirils/EDUCATION/03 RISEBA/2024/Datu priekšapstrāde/99 - EXAM/Pirmeksāmens/data/art_collection.csv", na = "NULL")

# EDA ####
# veicam kopējo datu kopas izpēti
  skim(data)
# pārbaudam datu tipu atilstību
  str(data)
  class(data)
  dim(data)
  glimpse(data)
  summary(data)
  
  
# Datu pārveidošana ####
data <- data %>%
    
    # pārveidojam datu tipus
  mutate(
    # mainām no int uz char
    Object.ID = as.character(Object.ID),
    # kopā ir 19 departamenti, labāk ir pārveidot par faktoriem, tālākai datu analīzei
    Department = as.factor(Department),
    # pārveidojam par datumu, izvēloties pareizo formātu
    Object.Begin.Date = as.Date(Object.Begin.Date, format = "%Y-%m-%d"),
    Object.End.Date = as.Date(Object.End.Date, format = "%Y-%m-%d"),
    # Nesaktoties uz lielo klasifikāciju daudzumu, iespējams varētu pārveidot tās par faktoreim, tālākai datu izpētei
    Classification = as.factor(Classification),
    Geography.Type = as.factor(Geography.Type),
    Country = as.factor(Country)
  ) %>% 
    
  # pārveidojam problemātiskas kolonas
    mutate(
  # Kolonas satur konfiktējošu informaciju, nepieciešama attīrīšana un ir iespējama pārformatēšana par
      Clean_Begin_Year = str_extract(str_trim(Artist.Begin.Date), "\\d{4}"),
      Clean_End_Year = str_extract(str_trim(Artist.End.Date), "\\d{4}"),
      Clean_Begin_Year = as.Date(Clean_Begin_Year, format = "%Y"),
      Clean_End_Year = as.Date(Clean_End_Year, format = "%Y")
    )
  
  # pārliecināmies par datu pareizu pārveidošanu  
  skim(data)
  
  # Datu apstrāde ####
  ## Izveidot jaunu mainīgo “Autora_info” ####
 data <-  data %>% 
    mutate(
      Autora_info = 
        ifelse(
        # pārbauda vai Artist vārds nav tukšs vai NA
          is.na(Artist.Display.Name) | Artist.Display.Name == "",
        # Ja ir, tad aizpilda ar nezināmu vārdu
          paste("Artist Unknown"),
        # ja artist ir zināms aizpilda ar nepieciešamiem datiem
        paste(Artist.Display.Name, year(Clean_Begin_Year),"-", year(Clean_End_Year)
              )))
  ## Izveid ot jaunu mainīgo “Objekta_gads” ####
  data <- data %>% 
    mutate(
      Objekta_gads =
        ifelse(
          is.na(Object.Name) | Object.Name == "",
          paste("Object Unknow"),
          paste0(Object.Name," (btw. ",year(Object.Begin.Date)," and ",year(Object.End.Date),")")
        
        )
    )
## Object.Name ####
  data <- data %>% 
    mutate(
      Credit.Line.year = substr(Credit.Line, (nchar(Credit.Line)) - 3, nchar(Credit.Line)),
      Credit.Line.year = as.Date(Credit.Line.year, format = "%Y"),
      Credit.Line.year = year(Credit.Line.year)
    )
  glimpse(data$Credit.Line.year)
  
## Izveidot datu tabulu ####
  # izveidojam datu tabulu
  dt_data <- as.data.table(data)
  # grupējam pa depratmantiem un izveijoam summu ar objektiemm, tad tos sortējam
  dt0 <- dt_data[, .N, by = Department][order(-N)]
  
## vai objektam ir dublikati ####\
data %>% 
  select(
    Object.Number, Object.ID, Object.Name
  ) %>% 
  skim()
  # ir 474833 unikāi objektu Identifikātori, tomēr 
  duplicat <-  data[duplicated(data$Object.Number) | duplicated(data$Object.Number, fromLast = TRUE),]  
  # varam pārbaudīt duplikātus
  View(data[data$Object.Number=="34.90.1" ,])
  # Nevar izdzēst dublikātus, var izveidot jaunu kolonu, kura nosaka ka ir dublikāti pēc objekta. numura
  data <- data %>% 
    mutate(
      is.Duplicate = ifelse( duplicated(data$Object.Number) | duplicated(data$Object.Number, fromLast = TRUE),
              TRUE, FALSE
      )
      
    )
