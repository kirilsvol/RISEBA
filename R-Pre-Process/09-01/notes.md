# Datu priekšapstrāde un datu pārvaldīšana, izmantojot R valodu
**09.01.25**

# 1. Datus var ielādēt caur API
![image](https://github.com/user-attachments/assets/1f9aeffe-9184-49f6-99c9-f51fc56a570e)

Ja grib ielādēt .csv un dati ir latviešu valodā vajag izvelēties **Encoding** CP1257, tas ir analogs UTF-8

**excel ielāde**
`
library(readxl)
datu_tab <- read_excel("C:/Users/24-019446/Downloads/datu_tab.xlsx")
`

**csv ielāde**
`datu_tab <- read.csv("C:/Users/24-019446/Downloads/datu_tab.csv", sep=";")`

**Kā attēlot vienīgi ierakstus ar Reģions Rīga**

`datu_riga <- datu_tab[datu_tab$"Reģions"=="Rīga",]`

Mēs izvēlamies tieši datu_tab tabulas "Reģions" kolonu, sakarā ar garumzīmēm, to nepieciešams likt quotoes

![image](https://github.com/user-attachments/assets/b2172fdb-0beb-41ab-9d0c-dd393b4feafc)

**Paņemt, kur Reģions ir Rīga, bet parādīt tikai 2 vai 3 kolonu**
```
datu_riga <- datu_tab[datu_tab$"Reģions"=="Rīga",-2]  #izmet ārā 2 kolonu
datu_riga <- datu_tab[datu_tab$"Reģions"=="Rīga",-3]  #izmet ārā 3 kolonu
datu_riga <- datu_tab[datu_tab$"Reģions"=="Rīga",-c(1,3)] # izmet ārā gan 1, gan 3 kolonu
```
**Ja ir vairāk kolonu, bet vajag tikai konkrētās**

`datu_riga <- datu_tab[datu_tab$"Reģions"=="Rīga",2:3]`

**Sortējam df pēc 2 kolonu datiem**

`dt_RL4 <- datu_tab[datu_tab$Reģions=="Rīga" & datu_tab$Vec_gr=="V25_34g",]`

## Data table
**Data table** - modernizēta *data frame* paveids, inicializācijas nepieciešams izmantot tā bibliotēku `library(data.table)`
`dt <- as.data.table(datu_tab)`

> Modernizēta data.frame versija
> 
> kurai data.frame ir kā rezerves variants, ja neizdodas izveidot data.table
> 
> Mazāk jāprogrammē – mazāka kļūdu iespējamība
>
> ātrāk darbojas
> 
> Līdzīga struktūra ar SQL

### Data table sintakse

> PiemersDT[i, j, by]
> 
> i – ar kādu apakškopu darbosimies
> 
> j – kādi aprēķini tiek veikti ar apakškopu i
> 
> by – kā tiek grupēti aprēķini
> 

`dt2 <- dt[Vec_gr=="V_24g" | Vec_gr =="V25_34", sum(skaits),  ]`

>[1] 279

`dt2_1 <- dt[Vec_gr=="V_24g" | Vec_gr =="V25_34", sum(skaits), "Reģions" ]   `

![image](https://github.com/user-attachments/assets/2763a08f-3c8d-43dd-8c2b-ca4afec968e2)

## Komentāru labā prakse
```
#Nosaukums
#Library padošana
```
**Var izveidot arī indeksāciju ar komentāriem**
```
# Pirmā daļa ###
## Otrā daļa ###
```
![image](https://github.com/user-attachments/assets/dd8505ea-dbc8-427a-b2c8-cf9559efe946)

## Datu ielāde no interneta ####
**IELĀDE NO .CSV**
Uzņēmuma reģistrā ir atvērto datu sadaļa, no kuras var importēt datus .r 
Lejuplādējam ar fread, kurš ir labs rīks .csv lejuplādēšanai
```
# http://dati.ur.gov.lv/beneficial_owners

owners <- fread("https://data.gov.lv/dati/dataset/b7848ab9-7886-4df0-8bc6-70052a8d9e1a/resource/20a9b26d-d056-4dbb-ae18-9ff23c87bdee/download/beneficial_owners.csv",
                encoding = "UTF-8")
owner2 <- owners[owners$nationality!="LV", c(2:8)]
```
**Ielāde no tīmekļa vietnes tabulām**

```
link1 <- "https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"
wikidata <- download_html(url = link1)
pop_table <- readHTMLTable(wikidata, header = TRUE, which = 1)
pop_table <- pop_table[-1, -c(1,5,8)]

```
