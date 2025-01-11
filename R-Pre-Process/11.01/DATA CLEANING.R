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
# Nepieciešams datus pivotot, tagad dati ir WIDE, vajag PivotLong
  tidyr::pivot_longer(cols = 3:5, names_to = "darbibas_forma", values_to="skaits") %>%
# izveidojam starp mainīgo pēc PIVOT
  mutate("gads" = 2021)
  
VID_NM_2020 <-   nm_skaits_2020 %>% 
  select(-c(6:7)) %>% 
  # sakārtojam kolonu nosaukumus
  rename("NACE" = "...1", "koda nosaukums" = "...2", "juridiskās pers." = "...3", "saimnieciskās darbības veicēji" = "...4", "individuālie komersantu"="...5") %>% 
  ## Datu sakārtošana ####
# izvēlamies rindiņas, kurām ir 1. kolonā cipari nevis burti
dplyr::filter(str_detect(NACE,"[:alpha:]")==FALSE) %>%
  # Nepieciešams datus pivotot, tagad dati ir WIDE, vajag PivotLong
  tidyr::pivot_longer(cols = 3:5, names_to = "darbibas_forma", values_to="skaits") %>%
  # pievienojam papildus kolonu
  mutate("gads" = 2020)
  
  new_bind <-  bind_rows(VID_NM_2020, VID_NM_2021)
  
# DATU APSTRĀDE ####
#grupēt summas pēc gadiem
 
  nm_sum_1 <- new_bind %>% 
    group_by(gads) %>% 
    summarise(kopskaits = sum(skaits, na.rm = TRUE))
# grupēt summas pa gadiem un pa nozarēm  
  nm_sum_2 <- new_bind %>% 
    group_by(gads, darbibas_forma) %>% 
    summarise(kopskaits = sum(skaits, na.rm = TRUE))
  
# apvienojam 2 tabulas un izveidojam īpatsavu
  
  nm_proce <- nm_sum_2 %>% 
    left_join(nm_sum_1, by = "gads") %>% 
    rename(skaits_f = kopskaits.x, kopskaits.y=kopskaits.y) %>% 
    mutate(ipatsvars = kopskaits.y/skaits_f) 
  
  
    
  
  