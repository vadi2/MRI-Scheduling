Profile: MRIServiceRequest
Parent: ILCoreServiceRequest
Id: mri-servicerequest
Title: "MRI Service Request"
Description: "מטרת פרופיל זה היא להגדיר ייצוג טופס החזר 17, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* created MS


Mapping: ServiceRequestToGertner
Source: MRIServiceRequest
Target: "http://www.gertnerinst.org.il"
Id: ServiseRequestMapping
Title: "מיפוי מידע ניהולי של תביעה למודל הנתונים של רשימת ההמתנה של MRI של גרטנר."
* created -> "MRI_Start_Certificate_Center_date"

Instance: minimal-servicerequest
InstanceOf: MRIServiceRequest
Usage: #example
/*
  The patient requests form 17 using a referral on 2020-01-01 14:42
*/
Description: "דוגמה למשאב תביעה מינימלית התואם לצרכי מדידת MRI."
