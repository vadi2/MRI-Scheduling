Profile: MRIClaimResponse
Parent: ClaimResponse
Id: mri-claimresponse
Title: "MRI ClaimResponse"
Description: "מטרת פרופיל זה היא להגדיר את המענה לטופס 17, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי"
* . ^short = "תשובה לבקשה טופס 17"
* item.adjudication
  * category MS
  * category ^short = "MRI confirmation status"
  * category from MRIConfirmationVS (required)

Mapping: ClaimResponseToGertner
Source: MRIClaimResponse
Target: "http://www.gertnerinst.org.il"
Id: ClaimResponseMapping
Title: "מיפוי מידע תגובת תביעה למודל נתוני רשימת ההמתנה של MRI של גרטנר."
* item.adjudication.category -> "MRI_Confirmation_Code"

Instance: minimal-claimresponse
InstanceOf: MRIClaimResponse
Usage: #example
Description: "דוגמה למשאב תגובה מינימלית לתביעה התואם לצרכי מדידת MRI."
* status = #active
* type = claim-type#institutional
* use = claim-use#preauthorization
* patient = Reference(minimal-patient)
* created = "2020-01-02T10:00:00+02:00"
* insurer = Reference(minimal-hmo)
* outcome = #complete
* request = Reference(minimal-claim)
