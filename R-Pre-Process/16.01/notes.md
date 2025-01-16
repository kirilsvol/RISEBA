# Studiju notes

### na.string mums nav vajadzīgs NA, varam nomainīt uz NULL

## Box plot skaidrojums

### veidojam boxplot r

`boxplot(data$lead_time, main = "Lead Time", ylab = "Lead Time")`

   Kastes augšdaļā ir 3. kvantile, apakša ir 1. kvantile, kastes vidus ir mediāna

   Viskeri ir 1 standartnovirze no vidējā, ja ir ārpus viskeriem nav fakts ka tā ir izlecoša vērtība. 

![image](https://github.com/user-attachments/assets/d4ff89bc-7e51-4f4c-b13b-eaff1b87260c)

### boxplot ekstrēmu vērtību sortēšana

Varam izņemt ekstrēmas vai nevēlams vērtības

`boxplot(data$lead_time[data$lead_time<550], main = "Lead Time", ylab = "Lead Time")`
### pievienojam x ass

` boxplot(data_n$adr[data_n$adr < 2000] ~ data_n$meal[data_n$adr < 2000]) `

**Svarīgi!!!, ja pievieno filtru y, tad to pašu vajag pievienot x**

![image](https://github.com/user-attachments/assets/197501d1-42e5-42ad-a190-02185264203c)

### pievienojam vēl vienu x ass sadalījumu

`boxplot(data_n$adr[data_n$adr < 2000] ~ data_n$meal[data_n$adr < 2000] + data_n$hotel[data_n$adr < 2000] )`

1. x ir 5 kategorijas, 2.x ir 2 kategorijas, beigu rezultāts būs 10 kategorijas

# ESQUISSER

```
#esquisser(data, )
esquisser(data_n, viewer = "browser" )
```


# LECTURE SCRIPT
```
# Bibliotēku ielāde ####
library(tidyverse)

# Compact and Flexible Summaries of Data
library(skimr)

# Jamovi toolset
library(jmv)

# atbild par grafikiem
library(esquisse)

# Ielādejam datus ####
data <- read.csv2("data/hotel_bookings_2016.csv", na.strings="NULL")

# Datu analīze ####

## Veicam aprakstošo datu analīzi ####
# kopējā funkcija
## skim(data)

## Datu masīva apstrāde #####
data_n <- data %>%
  
  # slēdzam ārā kādu no kolonām
  select(-c(1)) %>% 
    #! reservation_status_date saglabājās kā number, nepieciešams mainīt par datumu 

  mutate(
    # pārveidojam mainīgo par as.Date un pielikam number "%Y-%m-%d"
    reservation_status_date = as.Date(reservation_status_date, format="%Y-%m-%d"),
    # nominālos datus pārveidojam par faktoriem
    hotel = as.factor(hotel),
    meal = as.factor(meal),
    market_segment = as.factor(market_segment),
    agent = as.factor(agent)
    ) 
    

  #plot(x = data_t$meal, main = "Meal Type", xlab= "Type", ylab = "Count", col = "red")
  #hist(data$adr, breaks = 6)
# veidojam boxplot
  #boxplot(data$lead_time, main = "Lead Time", ylab = "Lead Time")
# noņemam ekstrēmas vērtības
#boxplot(data$lead_time[data$lead_time<550], main = "Lead Time", ylab = "Lead Time")
boxplot(data_n$adr[data_n$adr < 2000] ~ data_n$meal[data_n$adr < 2000] + data_n$hotel[data_n$adr < 2000] )


# grafiku appi ####

#palaižam aplikāciju

#esquisser(data, )
esquisser(data_n, viewer = "browser" )
```
