# Triki
- **CTRL + SHIFT + C** -> mult line comment
- #' ari  ir daudz rindu komentārs
- `&& / ||` rezultātā atgriezīs tikai vienu rezultātu, tas ir svarīgi
- **CTRL + SHIFT + M** - %>% shortcut

## MD komentāri
+ funkcijas return atgriež vienīgi vienu mainīgo un beidz funkciju.
+ Ja vēlas izvadīt varākos mainīgos, tos var izvadīt kā listu. Tad mēs varma piekļūt vai listā iebuvētās tabulas kolona `list$tabula$kolona`

+ Uzdevums #3 - man ir nepareizs matemātiskas formulējums
+ Nepieciešams izveidot for ciklus, kuri izveidot 2d matricu. Kad tiek veikt tāda summāciju, nosākuma summe kolonas, tad kolonas summu pievieno kopējais sumai
     
## 
Izpētīt normalizāciju

*diskrēts* - 

*kategoriāli* :

     + sakārtoti - ordināli
     + nomināls - bez sakārtojuma
### Normālsadalījums
**dnorm()** - simulē normālsadalījumu

**dunif()** - vienmērīgais sadalījums

### GGPLOT
- Izmantojot ggsave - svarīgi parādīt arī izmērus

## Eksāmens
1. izveidojam savu mapi ar datiem, kurā mēs uzsākam projektu
     Paskaidroja kas ir pivot table, un kāpēc tas būtu svarīgi
3. Izveidoju r skriptu un ielādēju bibliotēkas
4. Pārbauda, ka dati ir excel un ielādē ar readxl(nepieciešams to ielādēt). dati tiek ielādēti mainīgajā, alternatīva varam ielādēt no github.
     Ieladējot no excel vajag norādīt `(red_xlsx(data,sheet = "Sales")` un tad katrumi mainīgo saglabājam ar tabula_sheet `df_sales`
5. Strādājot ar tabulām `mutate()` atļauj pievienot jaunu kolonu.
Alternatīvi varam vienkārši pievienot jaunus datus

`dt_sales$gender_f <- ifelse(dt_sales$gender == "F", "Female","Male")`

Vai arī

```
dt_custoimer %>%
     mutate(Gender_full = case_wher(Gender = "F" ~" Female",

                                      Gender == "M"~"Male",
                                      
                                     .default = "Unknown")
```

5. Strādājot ar tabulām varam izmantot `summary()`, lai aprakstītu katru tabulu
6. Ielādējot tabulas nepieciešmas saprast vai tur ir **N/A** un vai tabulā ir pareizie datu tipi.

   Iespējams ir nepieciešams pāreveidot **,** par **.**

   Varbūt tekstā ir arī ciparu vietā burti
8. Pēc transformācijas ir vēlams starprezultātus saglabāt .csv ar `write_csv(tabula, "lokcāija/filename.csv")`.
  
   Alternatīva varam saglabāt r failu ar `saveRDS(tabula, "lokācija/filename.rds")`
8*. `list.files("data")` - listu ar folderiem un filiem tajos.

9. Apvienojam tabulas ar

    >Funkcija `left_join` varam veikt apakš pipe un tajā rakstīt vaicājumu
    ```
    dt_sales <- dt_sales %>%
         left_join(dt_customers %>% select(CustomerKey)# **šādi mēs veicam SQL vaicājumus**,
         by = c("Customer" = "CustomerKey"),
         relationship = "many-to-one")
    ```
   > vienā pipā mēs varam izveidot vairākus JOINUS
   ```
     
    dt_sales <- dt_sales %>%
         left_join(dt_customers %>% select(CustomerKey)# **šādi mēs veicam SQL vaicājumus**,
         by = c("Customer" = "CustomerKey"),
         relationship = "many-to-one") %>%
   # pievienojam papildus tabulu
  left_join(citatabula,
         by = c("Customer" = "CustomerKey"),
         relationship = "many-to-one") 
   
   
   ```

    >  Seit mēs apstrādājam agrāk atlasīto izveidotjot tabulu un attēlojam to
   
    ```
   dt_sales %>%
         group_by(Gender_full)     %>%
         summarize (n = n(), #lai iegūtu cik pirkumi katram dzimumam
                   ant_sales = sum(amount),
                   avg_ant_sakes = mean(amount))
     ```
    > Tabula vizualizācija
    ```
     dt_sales %>%
         ggplot(aes(x=Amount

    ```
                                     
                                     

