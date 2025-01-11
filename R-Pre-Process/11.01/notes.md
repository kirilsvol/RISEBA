# DATA CLEANING
Datus no excel var ielādēt automātiski, bet labāk to darīt manuāli, lai izpētītu excel pirms importēšanas.

Import -> excel table palīdz noņemt liekās rindas.

Imports palīdz izvēlēties sheet, skipot pirmās kolonas un nerādīt kolonu nosaukumus, var noteikt ko ar NA un mainīt nosaukumu

**izdzēšam liekās kolonas**

`VID_NM <-   nm_skaits_2024[,-c(6:7)]`

** pārsaucam kolonu nosaukumus**
```
VID_NM %>%
  # rename(data, "newname" = "old_name")
  rename("NACE" = "...1", "koda nosaukums" = "...2", "juridiskās pers." = "...3", "saimnieciskās darbības veicēji" = "...4", "individuālie komersantu"="...5")
```
%>% PIPE OPERĀTORA Ctrl + Shift + M

## Datu filtrēšana

Filtrācija atbild par rindu attēlošana, bet mēs vel izmantojam *str_detect* - kas atbilst par gadījuma stringu attēlošanu
```# izvēlamies rindiņas, kurām ir 1. kolonā cipari nevis burti
  dplyr::filter(str_detect(NACE,"[:alpha:]")==FALSE) %>%
```

## Datu pivots

Šie dati ir LONG, jeb vairākas kolonas, mums vajag lai būtu vairāk rindu.

![image](https://github.com/user-attachments/assets/3cd7ba02-2d3b-474e-86fb-e6968cd8c384)


## PIPE saglabājam starp rādītājus


```
  {. ->> VID_NM_c }
```

## datu sortēšanas piemērs

```
## Ielādējam datus ####
# izvēlamies .xlsx datus, sheetu, izlaižam 4 rindas un kolonām nav header
nm_skaits_2024 <- read_excel("11.01/nm_skaits_01012024.xlsx", 
                             sheet = "NACE_sekcijas_un_nodalas ", 
                             col_names = FALSE, skip = 4)
# izdžēšam liekās kolonas do datiem.
VID_NM <-   nm_skaits_2024 %>% 
  select(-c(6:7)) %>% 
  # sakārtojam kolonu nosaukumus
  rename("NACE" = "...1", "koda nosaukums" = "...2", "juridiskās pers." = "...3", "saimnieciskās darbības veicēji" = "...4", "individuālie komersantu"="...5") %>% 
## Datu sakārtošana ####
# izvēlamies rindiņas, kurām ir 1. kolonā cipari nevis burti
  dplyr::filter(str_detect(NACE,"[:alpha:]")==FALSE) %>%
#saglabājam starp mainīgo
  {. ->> VID_NM_b } %>% 
# Nepieciešams datus pivotot, tagad dati ir WIDE, vajag PivotLong
  tidyr::pivot_longer(cols = 3:5, names_to = "darbibas_forma", values_to="skaits") %>%
# izveidojam starp mainīgo pēc PIVOT
  {. ->> VID_NM_c } %>% 
# pievienojam papildus kolonu
  mutate("gads" = 2021) %>% 
  View()
```
# Šādi varam apvienot vairāku excelu aprstādi vienā datu masīvā
```
# DATA CLEANING ####

## Bibliotéku ielāde ####
# tidyverse - satur gan dplyr, gan tidyr

library(tidyverse)
library(readxl)

## Ielādējam datus ####
# izvēlamies .xlsx datus, sheetu, izlaižam 4 rindas un kolonām nav header
nm_skaits_2021 <- read_excel("11.01/nm_skaits_01012024.xlsx", 
                             sheet = "NACE_sekcijas_un_nodalas ", 
                             col_names = FALSE, skip = 4)
nm_skaits_2020 <- read_excel("11.01/nm_skaits_01012020.xlsx", 
                             sheet = "NACE_sekcijas_un_nodalas", 
                             col_names = FALSE, skip = 4)



# izdžēšam liekās kolonas do datiem.
VID_NM_2021 <-   nm_skaits_2021 %>% 
  select(-c(6:7)) %>% 
  # sakārtojam kolonu nosaukumus
  rename("NACE" = "...1", "koda nosaukums" = "...2", "juridiskās pers." = "...3", "saimnieciskās darbības veicēji" = "...4", "individuālie komersantu"="...5") %>% 
## Datu sakārtošana ####
# izvēlamies rindiņas, kurām ir 1. kolonā cipari nevis burti
  dplyr::filter(str_detect(NACE,"[:alpha:]")==FALSE) %>%
#saglabājam starp mainīgo
  {. ->> VID_NM_b } %>% 
# Nepieciešams datus pivotot, tagad dati ir WIDE, vajag PivotLong
  tidyr::pivot_longer(cols = 3:5, names_to = "darbibas_forma", values_to="skaits") %>%
# izveidojam starp mainīgo pēc PIVOT
  {. ->> VID_NM_c } %>% 
# pievienojam papildus kolonu
  mutate("gads" = 2021)
  
VID_NM_2020 <-   nm_skaits_2020 %>% 
  select(-c(6:7)) %>% 
  # sakārtojam kolonu nosaukumus
  rename("NACE" = "...1", "koda nosaukums" = "...2", "juridiskās pers." = "...3", "saimnieciskās darbības veicēji" = "...4", "individuālie komersantu"="...5") %>% 
  ## Datu sakārtošana ####
# izvēlamies rindiņas, kurām ir 1. kolonā cipari nevis burti
dplyr::filter(str_detect(NACE,"[:alpha:]")==FALSE) %>%
  #saglabājam starp mainīgo
  {. ->> VID_NM_b } %>% 
  # Nepieciešams datus pivotot, tagad dati ir WIDE, vajag PivotLong
  tidyr::pivot_longer(cols = 3:5, names_to = "darbibas_forma", values_to="skaits") %>%
  # izveidojam starp mainīgo pēc PIVOT
  {. ->> VID_NM_c } %>% 
  # pievienojam papildus kolonu
  mutate("gads" = 2020)
  
  new_bind <-  bind_rows(VID_NM_2020, VID_NM_2021)
```
## Kā saglabāt rezultātu

saglabājam tabulu kā dokumentu
```
 nm_proce %>% 
    write.csv("nozares.csv", fileEncoding="windows-1257" ) %>% 
    saveRDS("nozaresRDS.rds")
```
