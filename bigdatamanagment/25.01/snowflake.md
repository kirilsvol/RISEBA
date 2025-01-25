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

## Warehouse

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

## Users & Roles

Varam pievienot vēl lietotājus, mainīt lietotāju roles

**Roles**
- **ACCOUNTADMIN** - visas snowflake tiesības, resorsu tēriņi, monitori, warehouse izveidot. Nav laba prakse strādāt ACCOUNTADMIN role
- **SYSADMIN** - snowflake rekomendē parastajam lietotājam. Minimāli piekļuves varianti. 
- Var izveidot savus roles

## Accounts

Projekta lietotāja pārvaldes logs. Nepieciešams pievienot 

>
>  **Locator** - Konta ID, pēc kā var atrast lietotāju.
>
> 
