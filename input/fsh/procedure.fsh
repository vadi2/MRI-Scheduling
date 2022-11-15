Profile: MRIProcedure
Parent: ILCoreProcedure
Id: mri-procedure
Title: "MRI Procedure"
// FIXME: auto-translated
Description: "מטרת פרופיל זה היא להגדיר ייצוג של הליך MRI, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* performer ^slicing.discriminator.type = #profile
* performer ^slicing.discriminator.path = "actor.resolve()"
* performer ^slicing.rules = #open
* performer ^slicing.ordered = false
* performer contains mriProvider 1..1
* performer[mriProvider] ^short = "Health provider where the MRI took place"
  * actor only Reference(MRIProvider) 
    * ^short = "Reference to the organization"
  * onBehalfOf only Reference(MRIProvider)

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
* code = MedicalServiceMoH#74181 "MRI בטן, לנבדק ליום"
* subject = Reference(minimal-patient)
* performedDateTime = "2013-04-05"
* performer
  * actor = Reference(minimal-provider)
  * onBehalfOf = Reference(minimal-provider)
