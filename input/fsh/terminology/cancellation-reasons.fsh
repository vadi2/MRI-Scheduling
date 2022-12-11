CodeSystem: CancellationReasonCodeSystem
Id: appointment-cancelation-reasons
Title: "Reasons for canceling an appointment"
Description: "רשימה מרוכזת של סיבות לביטול תור. זה שונה מ https://terminology.hl7.org/4.0.0/CodeSystem-appointment-cancellation-reason.html מכיוון שזוהי מערכת קוד לדוגמה"
* ^caseSensitive = true
* ^experimental = false

* #cancelled "הפגישה בוטלה"
* #patient-postponed "התור נדחה למועד מאוחר יותר מסיבות סבלניות"
* #patient-cancelled "התור בוטל מסיבות סבלנות"
* #clinician-postponed "התור נדחה למועד מאוחר יותר מסיבות קלינאי/רופא"
* #clinician-cancelled "התור בוטל מסיבות של קלינאי/רופא"
* #device-postponed "התור נדחה למועד מאוחר יותר מסיבות מכשירי MRI"
* #device-cancelled "התור בוטל מסיבות של מכשיר MRI"
* #other "סיבה אחרת"

ValueSet: AppointmentCancellationReasonVS
Id: AppointmentCancellationReasonVS
Title: "Possible reasons for canceling an appointment"
Description: "סט ערכי של סיבות אפשריות לביטול פגישה"
* ^experimental = false
* include codes from system CancellationReasonCodeSystem
