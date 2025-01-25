# Snowflake
Izmanojot AWS  - var ielādēt un apstrādāt datus.

Visi pushotie dati nonāk github, no github tie tiek integrēti un palaisti snowflake. 

## Uzstādīšanas algoritms

1. Nepieciesams izveidot warehouse projektam
2. Izveidojam resource monitor warehouse
   2.1 Izveidojam resource monitorue accountam
       2.1.1 Visam acc, par trail periodu
       2.1.2. Daily budget

## Cost managment

*admin panel* -> *cost managment* -> *resource monitor* -> **+ RESOURCE MONITOR**

> Šeit varam pievienot resursu monitoru, lai nepārtērēt budžetu

![image](https://github.com/user-attachments/assets/052574a3-6da1-4cd5-a4cc-195437c9ce51)



**Svarīgākie uzstādījumi**

### Daily limit (resource monitor)

> Credit - 20
> 
> Monitor type - Account
> 
> Schedual - Daily
> 
> Action
> 
>         - 95% Suspend or disable immediately and notify when this % of credit is used
>         - 85% Suspend or disable and notify when this % of credit is used
>         - 75% Notify when this % of credit is used.

#### Warehouse limit (resource monitor)
> Credit - 10
> 
> Monitor type - Warehouse
> 
> Warehouse - COMPUTE_WH
> 
> Schedual - Daily
> 
> Action
> 
>         - 95% Suspend or disable immediately and notify when this % of credit is used
>         - 85% Suspend or disable and notify when this % of credit is used
>         - 75% Notify when this % of credit is used.
> 

#### account_lock (resource monitor)
> Credit - 395
> 
> Monitor type - Account
> 
> Schedual - Never
>
> Action
> 
>         - 95% Suspend or disable immediately and notify when this % of credit is used
>         - 85% Suspend or disable and notify when this % of credit is used
>         - 75% Notify when this % of credit is used.
![image](https://github.com/user-attachments/assets/8f5ccffe-5f42-4598-8444-d172314e55f8)

## Warehouse

![image](https://github.com/user-attachments/assets/338c3591-bbd7-4e08-a516-5049e7c9974c)

Datu glabātuve

### Pievienosim jaunu warehouse
*admin panel* -> *warehouse* -> **+ WAREHOUSE**

#### riseba_warehouse (+ warehouse)
> Name - riseba_warehouse
>
> Comment - 
>
> Type - *standart*
>
> Size - XSmall
>
>     Nepieciešams novērtēt kādu no izmēriem ņemt attiecīgi projekta izmēriem.>
>
> Advanced options
>
>   Auto-resumxe [X]
> 
>   Auto-suspent [X]
>   / Suspend After - 1 min
>
>   Multi-cluster Warehouse [ ] - Sistēma automātiski pievienos vēl klāsterus, ja izvēlētais size neatbilst pieprasījumam
>
>   Query Acceleration [ ] - Palīdz realtime date apstrādē

Pēc warehouse izveides nepieciešams **SYSADMIN** iedot tiesības uz warehouse. **Transfer Ownership**

## Users & Roles

Varam pievienot vēl lietotājus, mainīt lietotāju roles

**Roles**
- **ACCOUNTADMIN** - visas snowflake tiesības, resorsu tēriņi, monitori, warehouse izveidot. Nav laba prakse strādāt ACCOUNTADMIN role
- **SYSADMIN** - snowflake rekomendē parastajam lietotājam. Minimāli piekļuves varianti. 
- Var izveidot savus roles
- Labi ir izveidot Roles katram Warehouse

![image](https://github.com/user-attachments/assets/80de04c8-3c0b-46c5-a227-a0b00d6f14c2)

- Varam piešķir privilēģijas veidot noteiktas DB komandas ( Roles -> burger -> Manage global privileges)
![image](https://github.com/user-attachments/assets/2fdad80f-5363-4ea2-8205-5b5e906efe58)

- Izvēlamies privilēģiju no saraksta un GRANT OPTION [X]
![image](https://github.com/user-attachments/assets/2ccf5d31-7c47-4eea-a4de-b5481153d6fc)

## Accounts

Projekta lietotāja pārvaldes logs. Nepieciešams pievienot 

>  **Locator** - Konta ID, pēc kā var atrast lietotāju.

**Reader account** - Read only acc, tikai lasīt, bet nevar mainīt
> Admin -> Account -> Reader account
>
> Sample ACC - (KV_READER) (390jb;Uc4l<n)

## Projects

### Worksheets
*Varam izmantot darbam ar SQL*

Izveidojam jaunu worksheet 
![image](https://github.com/user-attachments/assets/064109ba-e03c-4a58-9267-2420bdf53979)

Varam pārsaukt projektu
![image](https://github.com/user-attachments/assets/74afe9e7-4176-431a-8822-581b73f41934)

Varam izvēlēties datubāzi un lietotāju, best practice strādāt ar SYSADMIN, lai minimizētu problēmas. Gadījuma ja **SYSADMIN** nav tiesību, nepieciešams **WAREHOUSE** sadaļā **TRANSFARE OWNERSHIP**

![image](https://github.com/user-attachments/assets/41a52e49-71f9-40e2-bf70-414b31dd8640)

#### PROGRAMMA KODS
Izveidojama datubāzi  ` CREATE DATABASE riseba_db `, nepieciešams īslaicīgi mainīt privilēģaijas uz accountadmin.

### Notebooks 
*Varma izmantot koda kompilācijai* - šeit varam mākonī kompilēt sažādu kodu
### Streamlit
*streamlit* - tehniski ir pyton bibliotēka, mobilajām aplikācijām,  
### Dashboard
*dashboard* - vizualizācijas panelis
### App packages
*app packages* - izveidot jaunu aplikāciju kompleksu 

## Data Products

### Marketplace
**market place**  - var ņemt datus 





