CodeSystem: CancellationReasonCodeSystem
Id: appointment-cancelation-reasons
Title: "Reasons for canceling an appointment"
Description: "רשימה מרוכזת של סיבות לביטול תור. זה שונה מ https://terminology.hl7.org/4.0.0/CodeSystem-appointment-cancellation-reason.html מכיוון שזוהי מערכת קוד לדוגמה"
* ^caseSensitive = true
* ^experimental = false

* #cancelled "הפגישה בוטלה"
* #patient-postponed "התור נדחה למועד מאוחר יותר על ידי המטופל"
* #patient-cancelled "התור בוטל על ידי המטופל"
* #clinician-postponed "התור נדחה למועד מאוחר יותר על ידי קלינאי/רופא"
* #clinician-cancelled "התור בוטל על ידי קלינאי/רופא"
* #device-postponed "התור נדחה למועד מאוחר יותר מסיבות טכניות MRI"
* #device-cancelled "התור בוטל מסיבות טכניות MRI"
* #other "סיבה אחרת"

ValueSet: AppointmentCancellationReasonVS
Id: AppointmentCancellationReasonVS
Title: "Possible reasons for canceling an appointment"
Description: "סט ערכי של סיבות אפשריות לביטול פגישה"
* ^experimental = false
* include codes from system CancellationReasonCodeSystem
