Profile: MRIClaim
Parent: ILCoreClaim
Id: mri-claim
Title: "MRI Claim"
Description: "מטרת פרופיל זה היא להגדיר ייצוג טופס החזר 17, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* . ^short = "בקשה טופס 17"
* created ^short = "תאריך בקשה לטופס 17 על ידי המטופל"

Mapping: ClaimToGertner
Source: MRIClaim
Target: "http://www.gertnerinst.org.il"
Id: ClaimMapping
Title: "מיפוי מידע ניהולי של תביעה למודל הנתונים של רשימת ההמתנה של MRI של גרטנר."
* created -> "MRI_Start_Certificate_Center_date"

Instance: minimal-claim
InstanceOf: MRIClaim
Usage: #example
/*
  The patient requests form 17 using a referral on 2020-01-01 14:42
*/
Description: "דוגמה למשאב תביעה מינימלית התואם לצרכי מדידת MRI."
* meta.profile = Canonical(MRIClaim)
* status = #active
* type = claim-type#institutional
* use = #claim
* patient = Reference(minimal-patient)
* created = "2020-01-01T14:42:00+02:00"
* provider = Reference(minimal-hmo)
* priority = ProcessPriority#normal
* insurance
  * sequence = 1
  * focal = true
  * coverage
    // example of using an extension in place of an actual Reference if it's not available
    * extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
    * extension.valueCode = data-absent-reason#unknown "Unknown" 
    * display = "Coverage information is unknown"
