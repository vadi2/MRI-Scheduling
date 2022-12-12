Profile: MRIClaimResponse
Parent: ClaimResponse
Id: mri-claimresponse
Title: "MRI ClaimResponse"
Description: "מטרת פרופיל זה היא להגדיר את המענה לטופס 17, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי"
* . ^short = "תשובה לבקשה טופס 17"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slicing to ensure form 17 number is present"
* identifier ^slicing.ordered = false
* identifier contains form17 0..1 MS
* identifier[form17] MS
  * system = Form17Number
  * value 1..1 MS

* item
  * adjudication ^short = "פרטי פסיקה"
    * category MS
    * category ^short = "סטטוס אישור MRI"
    * category from MRIConfirmationVS (required)
    * reason MS
    * reason ^short = "הסבר על ההחלטה"
* request MS
* request ^short = "טופס בקשה מקורי 17"
* request only Reference(MRIClaim)
* created and insurer MS
* insurer only Reference(MRIHMO)

Mapping: ClaimResponseToGertner
Source: MRIClaimResponse
Target: "http://www.gertnerinst.org.il"
Id: ClaimResponseMapping
Title: "מיפוי מידע תגובת תביעה למודל נתוני רשימת ההמתנה של MRI של גרטנר."
* created -> "MRI_Confirmation_Date"
* insurer -> "MRI_17_Form_Provider_Code"
* item.adjudication.category -> "MRI_Confirmation_Code"
* item.adjudication.reason -> "MRI_refuse_reason"
* identifier[form17] -> "MRI_17_Form_Number"

Instance: minimal-claimresponse
InstanceOf: MRIClaimResponse
Usage: #example
Description: "דוגמה למשאב תגובה מינימלית לתביעה התואם לצרכי מדידת MRI."
* meta.profile = Canonical(MRIClaimResponse)
* identifier
  * system = Form17Number
  * value = "12345"
* status = #active
* type = claim-type#institutional
* use = claim-use#preauthorization
* patient = Reference(minimal-patient)
* created = "2020-01-02T10:00:00+02:00"
* insurer = Reference(minimal-hmo)
* outcome = #complete
* request = Reference(minimal-claim)
* item
  * itemSequence = 1
  * adjudication
    * category = MRIConfirmationCodeSystem#approved

Instance: rejected-claimresponse
InstanceOf: MRIClaimResponse
Usage: #example
Description: "דוגמה לתגובת מינימום תביעה שנדחתה"
* meta.profile = Canonical(MRIClaimResponse)
* identifier
  * system = Form17Number
  * value = "12345"
* status = #active
* type = claim-type#institutional
* use = claim-use#preauthorization
* patient = Reference(minimal-patient)
* created = "2015-05-05T14:59:59+02:00"
* insurer = Reference(minimal-hmo)
* outcome = #complete
* request = Reference(minimal-claim)
* item
  * itemSequence = 1
  * adjudication
    * category = MRIConfirmationCodeSystem#rejected
    * reason.text = "הכוכבים לא מסתדרים היום"
