Profile: MRIClaim
Parent: ILCoreClaim
Id: mri-claim
Title: "MRI Claim"
Description: "מטרת פרופיל זה היא להגדיר ייצוג טופס החזר 17, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* . ^short = "בקשה טופס 17"
* created ^short = "תאריך בקשה לטופס 17 על ידי המטופל"
* procedure MS

Mapping: ClaimToGertner
Source: MRIClaim
Target: "http://www.gertnerinst.org.il"
Id: ClaimMapping
Title: "מיפוי מידע ניהולי של תביעה למודל הנתונים של רשימת ההמתנה של MRI של גרטנר."
* created -> "MRI_Start_Certificate_Center_date"
* procedure.procedureReference -> "Pay_Entity_Code"

Instance: minimal-claim
InstanceOf: MRIClaim
Usage: #example
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
    * extension.valueCode = data-absent-reason#not-applicable "Not Applicable" 
    * display = "Coverage information is not applicable here and can be derived from the HMO code"


Instance: minimal-claim-with-procedure
InstanceOf: MRIClaim
Usage: #example
Description: "דוגמה למשאב תביעה מינימלי התואם לצרכי מדידת MRI. תביעה מעודכנת זו נשלחת לאחר שנעשה הליך עם הפניה לנוהל."
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
    * extension.valueCode = data-absent-reason#not-applicable "Not Applicable" 
    * display = "Coverage information is not applicable here and can be derived from the HMO code"
* procedure
  * sequence = 1
  * procedureReference = Reference(minimal-procedure)
