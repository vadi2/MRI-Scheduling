Profile: MRIServiceRequest
Parent: ILCoreServiceRequest
Id: mri-servicerequest
Title: "MRI Service Request"
Description: "מטרת פרופיל זה היא להגדיר ייצוג טופס החזר 17, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* intent and authoredOn and code and reasonCode and priority and requester MS
* reasonCode from MriTypeCodesVS (preferred) 
* reasonCode ^short = "5 or 9 digits MRI procedure code or condition code"
* code from MriTypeCodesVS (preferred) 
* code ^short = "5 or 9 digits MRI procedure code"

Mapping: ServiceRequestToGertner
Source: MRIServiceRequest
Target: "http://www.gertnerinst.org.il"
Id: ServiseRequestMapping
Title: "מיפוי מידע ניהולי של תביעה למודל הנתונים של רשימת ההמתנה של MRI של גרטנר."
* authoredOn -> "MRI_Referral_date"
* code -> "MRI_Referral_Type_Code"
* reasonCode -> "MRI_Referral_Reason"
* priority -> "MRI_Urgency"
* requester -> "MRI_Referral_Private"

Instance: minimal-servicerequest
InstanceOf: MRIServiceRequest
Usage: #example
/*
  The patient requests form 17 using a referral on 2020-01-01 14:42
*/
Description: "דוגמה למשאב תביעה מינימלית התואם לצרכי מדידת MRI."
* intent = #order
* subject = Reference(minimal-patient)
* status = #active
* authoredOn = "2022-02-09T13:28:17-05:00"
* code = MedicalServiceMoH#74181 "MRI בטן, לנבדק ליום"
* reasonCode = MedicalServiceMoH#74181 "MRI בטן, לנבדק ליום"
* priority = #stat
* requester = Reference(minimal-hmo)
