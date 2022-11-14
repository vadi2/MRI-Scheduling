Profile: MRIProcedure
Parent: ILCoreProcedure
Id: mri-procedure
Title: "MRI Procedure"
// FIXME: auto-translated
Description: "מטרת פרופיל זה היא להגדיר ייצוג של הליך MRI, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* performer.actor only Reference(MRIHMO)
* performer.onBehalfOf only Reference(MRIHMO)

// add providers codesystem and valueset

Mapping: ProcedureToGertner
Source: MRIProcedure
Target: "http://www.gertnerinst.org.il"
Id: ProcedureMapping
Title: "מיפוי המידע האדמיניסטרטיבי והקליני של פרוצדורה למודל נתוני רשימת המתנה MRI של גרטנר."
* performer.actor -> "MRI_Provider_Code"
* performer.onBehalfOf -> "MRI_Provider_Code"

Instance: minimal-procedure
InstanceOf: MRIProcedure
Usage: #example
Description: "דוגמה למשאב מינימלי של הליך התואם את צורכי מדידת ה-MRI"
* meta.profile = Canonical(MRIProcedure)
* status = #completed
* code = #74181 "MRI בטן, לנבדק ליום"
* subject = Reference(minimal-patient)
* performedDateTime = "2013-04-05"
* performer
  * actor = Reference(minimal-hmo)
  * onBehalfOf = Reference(minimal-hmo)
