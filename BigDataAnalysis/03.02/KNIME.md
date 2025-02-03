# KNIME

- Pirmie rīki (node) ir ielasīšanas rīki, katram formātam ir ielasīšanas rīks. Var izmantot arī vispārējo rīku, kurš analize datu kopu un pieņem lēmumu.
	- Varam norādīt lokāciju, header un dokumenta uzstādījumu 
	- Katarm rīkam ir detalizēta konfigurācija.
 - Otrais solis (specifisks datu kopai) - Datu tipa manipulātors. _(NUMBER TO STRING)_
 - Trešais solis - _(PARTITIONING)_ sadām 80% pamata grupā, 20% otrā grupā _(validācijas datu kopa)_ un svarīgi izvēlēties, lai _draw random_
 - Ceturais solis - Pievienojam mašīnu mācīšanas modelim **XGBOOST**
 	- Modeli nepieciešams konfigurēt
  		- Norādīt atkarīgo mainīgo, jeb pētamo mainīgo
    		- Atsevišķi norādāt neatkarīgos mainīgos
-  Piektais solis - _(XGPOOST PREDICTOR)_ paņem modeļa apmācības rīka rezultātu un iebaro prediktorā un blakus iebaro validācijas datu kopā.
-  Sestais solis - _(ROC līknes rīks)_ - izveido ROC līkni, lai mēs varētu validēt katru no datu kopu bāzētiem pareģojumiem.
-  Septītais solis - Modeļa kvalitātesilustrācijai _(LIFT CHART)_- Vairāk parāda par iespējamām problēmām. 
