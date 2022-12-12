Profile: MRIServiceRequest
Parent: ILCoreServiceRequest
Id: mri-servicerequest
Title: "MRI Service Request"
Description: "מטרת פרופיל זה היא להגדיר ייצוג טופס החזר 17, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* intent MS


Mapping: ServiceRequestToGertner
Source: MRIServiceRequest
Target: "http://www.gertnerinst.org.il"
Id: ServiseRequestMapping
Title: "מיפוי מידע ניהולי של תביעה למודל הנתונים של רשימת ההמתנה של MRI של גרטנר."
* authoredOn -> "MRI_Referral_date"

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
