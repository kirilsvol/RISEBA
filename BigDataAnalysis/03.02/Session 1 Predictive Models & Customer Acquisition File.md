## Customer Life Cycle


![image](https://github.com/user-attachments/assets/d89ddd8c-43d5-4edf-aed2-91f5f62e4b2f)

**Klienta dzīves cikls**

1. **Reach** - Nepieciešams atrast klients, saprast ir potenciālie klietnu un kā tos atrast?
2. **Acquisition** - Klientu iegūšana / piesaiste, klients sāk interesēties par piedāvājumu.

2.1 **Abandoment** - Pamešana, bez pirkuma veikšanas.

3. **Conversion** - Konvertējam no potenciāla uz īstu klientu

3.1 **Attrition** - Klientu zaudēšanu.

4. **Retention** - Klienta uzturēšana. 

4.1 **Churn** - Klientu apgrozījums, 

5. **Loyal** - Lojāla klienta iegušāna.

---
## Klientu piesaistes modeļi

Klientu piesaiste ir atkarīga no uzņēmuma nozares, dažādiem klientiem ir dažādi klienti ar dažādiem piesaistes kanāliem, nepieciešams izmantot dažādus analītikas kanālus. Atkarībā no iegūstamiem klientiem tiek mainīta klientu iegūšanas anlītika.
	Bankas sektorā ir svarīgi netikai cilvēki kuri kredītkarti ir saņēmuši, bet kuri to arī izmanto
 Veidojot klientu piesaistes modeli ir svarīgs gan datu daudzums, gan datu kvalitāte.

 ---

 ## Prognozēšanas umodeļa izstrādes posmi

 ![image](https://github.com/user-attachments/assets/ff1c5948-d8d4-4577-a673-8cadd87ac250)

 1. **Requirment gathering** - Kāds ir modeļa mērķis - 
 2. **Data preperation** - Datu sagatavošana - datu transformācijas - missing data, datu tipu labošana.
 3. **Model development** :
	- 1. _Feature engineering_
	- 2. _Algorithm selection_
	- 3. _Hyper-parameter tuning_  
	- 4. _Model validation_
		- Pašā proces sākumā **Data preperation**, pēc datu atvasināšanas, mēs datu kopu sadalām daļās. Lielāko datu kopas daļu izmantojam modeļa apmācībai,
		- Otro daļu paturam atsevišķi nedodot modelim. Ja modelis ir pārapmācīts, viņam validācijas kopā sliktāki rezultāti par pamata datu kopu.
		- Trešo daļa netiek dota modelētājam, lai pārbaudīt modeli patstāvīgi

 4. **Model deployment** - 
 5. **Model managment** -

### Modeļa izstrādes bāzes koncepti
- The business purpose of a predictive model is to use information available in the present to predict a future event or development (the
outcome or “target variable”)
- In the case of an acquisition model we use data about someone before they become a customer to predict the probability that they
will become one; but first we use historical data to build the model
 - During model development the observation window is the data time frame containing the predictor data (the “present”)
 - The performance window is the data time frame in which the acquisition occurred (the “future”)
 - When creating the model’s data set one must not permit information from the performance window to be among the predictor
variables; failing to do so will make it impossible to deploy the model (this is known as the “future information” problem)
- When there is a sufficient number of data points, model development data sets are usually partitioned into three subsets using a strict
randomization process
	- The largest is the “training data” – this is the raw material that the modeling methodology’s algorithm will learn from
	- The “validation data”, also known as “test data”, typically 10%-20% of the original data, is used by the modeling methodology to
calculate model accuracy on data not used (“unseen”) by the algorithm in its learning stage
	- Validation data guards against situations where an algorithm becomes overly dependent on unusual instances in the training data
that are infrequent in the overall data (this is known as “overfitting” the data and can be a problem with some highly iterative
modeling methods, like Gradient Boosting Machines)
	- The “hold-out data”, also 10%-20% of the original data, is not provided to the model development team and is used by
management as a final check on the model’s validity; a model’s accuracy in the hold-out data should not be materially different
from that obtained on the training and validation data
- When there is insufficient data for a three-way partition there are two work-arounds:
	- Instead of using a separate validation data set the algorithm can be instructed to use “N-fold cross-validation”, in this approach
the training data is sliced into N pieces and model iterations are tested for uniformity across the N individual slices
	- The validation and hold-out data sets are combined into one
---

## Modeļa pieņemšana

![image](https://github.com/user-attachments/assets/d6363d89-4687-4518-81fe-1761b4c09188)

Pēc modeļa izstrādes ir jāizveido parametri pēc kuriem noteikt modeļa precizitāti. Tam tiek izmantoti populāri metriki


### Confusion matrix skaidrojums
Datu masīvā katrai datu rindai tiek veikti predicitv mērījumi un blakus likti faktiskie iznākumi, intervāla no 0 - 100, Prognozes kodēja ja varbūtība ir no 0-50 tad par negatīvu iznakumu, bet 51-100 par pozitīvu iznākumu. Actual data gan ir binārs, kurā ir 0 vai 1
- **Kļūdu matrics** (_Confusion Matrix_) - Modelis katrma iznākuma veido
	- 1. Kvadrantā prognozē iznākumu un sakrīt
   	- 2. Prognozē negatīvi, bet realitātē sanāca
   	- 3. Pronozēja pozitīvi, bet realizēt nesanāca
   	- 4. Prognozeja un nesanāca    
### ROC (Receiver Operating Characteristics Curve)

![image](https://github.com/user-attachments/assets/3721c7b3-4192-47f3-be1a-7eae96bd6c63)

- Sadalam datus 100 sektoros
- Līnija ir randoms, ka katrs iznākums ir 50/50
- Zilā līnija ir modeļa kumulatīvais rezultāts, Mēs mēram laukumu no līnijas līdz melnajai līnijai, jo tas ir tuvāks 1, jo labāk.
