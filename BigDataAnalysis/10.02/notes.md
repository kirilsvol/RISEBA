# Linērāi regresijai


# Lēmum koks (decision tree)

![image](https://github.com/user-attachments/assets/efe53228-b97b-48ee-ae88-f110b3fe1c98)


_Analoģija regersijas modelim_

**Nav grafiskās daļas, ir grupas un apakšgrupas.**

No visas datu kopas, atrod vienu mainīgo pēc kā sadalīt datus 2 daļās. Tad katru no apakšgrupām sadala pēc citiem mainīgiem, bet izmanto jau citus mainīgos katrā grupā, katrai grupai atrod mainīgo.


![image](https://github.com/user-attachments/assets/1554c4c7-f770-4b14-a129-a04270d54274)

Viss sākas no atkarīgā mainīgā, tad visos kategories ir atkarīgā mainīgā vidējais grupā. Tad sadala divās grupās, kuriem ir lielākās atšķirības no atkarīgā mainīgā vidējā. 

Līmeņus var izveidot pašā pētījuma sākumā, tā var sadalīt datus dažādās grupās. 

Lēmumu kods pats atrod mainīgo kombinācijas, kuras vislabāk aprasta mainīgo. Datiem nav nepieciešama lineārā korelācija starp datiem.

> No viena datu masīva var izveidot varākus lēmumu kokus, to sauc par **koku ansambi**

## dažādi lēmumkoki

- Nejaušinātias mežš **(Random Forest)**, piemēro skaitliskiem mainīgiem
- XGBoost, izmanto kategorizēšanas uzdevumiem


## labas prakses
- Lēmum koki labāk strādā ar 10K+ rindiņam, 
- Risinot klasifikācijas problēmas, labā prakse, 15% ir no prognozējamās vērtības ir jābūt datos.
- Datu sadalījums (80%/20% splits)
  - 80% training data, izmanto modeļa apmācībai
  - 20% validācijas data, izmanto modeļa pārbaudei, izmanto ROC līkni, lai pārbaudīt modeļa validāciju.
  - Ja ROC līknes laukums svarp training data un validācijas datiem ir līdzīgs varam tos pieņemt.

### Freeware GUI modeling platforms

- KNIME https://www.knime.com/downloads
- ORANGE https://orangedatamining.com/
- RAPID MINER

 # Gradient Boosting Machines (GBMs)

**!!! NEPIECIEŠAMS IEPAZĪTIES AR GRADIENT BOOSTING MACHINES !!!**

 ![image](https://github.com/user-attachments/assets/cff6e5b0-72fd-4038-aa13-03a6664f3bf3)

 For a thorough discussion of GBM methodology and R code samples see: http://uc-r.github.io/gbm_regression
• For a 15 minute video explaining the intuition behind the XGBoost machine learning method see:
• https://www.youtube.com/watch?v=en2bmeB4QUo or
• https://www.youtube.com/watch?v=j034-r3O2Cg
• For more of a historical perspective see (17 minutes):
• https://www.youtube.com/watch?v=MIPkK5ZAsms
• A one-page overview: https://affine.ai/gradient-boosting-trees-for-classification-a-beginners-guide/

