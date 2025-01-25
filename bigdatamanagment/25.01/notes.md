## Snowflake
Izmanojot AWS  - var ielādēt un apstrādāt datus.
### Cost managment
*admin panel* -> *cost managment* -> *resource monitor* -> **+ RESOURCE MONITOR**
> Šeit varam pievienot resursu monitoru, lai nepārtērēt budžetu
**Svarīgākie uzstādījumi**
#### Daily limit (resource monitor)
> Credit - 20
> Monitor type - Account
> Schedual - Daily
> Action  - 95% Suspend or disable immediately and notify when this % of credit is used
>         - 85% Suspend or disable and notify when this % of credit is used
>         - 75% Notify when this % of credit is used.

#### Warehouse limit (resource monitor)
> Credit - 10
> Monitor type - Warehouse
> Warehouse - COMPUTE_WH
> Schedual - Daily
> Action  - 95% Suspend or disable immediately and notify when this % of credit is used
>         - 85% Suspend or disable and notify when this % of credit is used
>         - 75% Notify when this % of credit is used.

#### account_lock (resource monitor)
> Credit - 395
> Monitor type - Account
> Schedual - Never
> Action  - 95% Suspend or disable immediately and notify when this % of credit is used
>         - 85% Suspend or disable and notify when this % of credit is used
>         - 75% Notify when this % of credit is used.
