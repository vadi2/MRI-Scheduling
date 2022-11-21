Profile: MRIDiagnosticReport
Parent: ILCoreDiagnosticReport
Id: mri-diagnostic-report
Title: "MRI DiagnosticReport"
Description: "מטרת פרופיל זה להגדיר ייצוג של דו\"ח רפואי כתוצאה מהליך MRI, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* issued MS


Mapping: DiagnosticReportToGertner
Source: MRIDiagnosticReport
Target: "http://www.gertnerinst.org.il"
Id: DiagnosticReportMapping
Title: "מיפוי המידע הקליני של DiagnosticRerport למודל נתוני רשימת המתנה MRI של גרטנר."
* issued -> "MRI_Decipher_Date"

Instance: minimal-diagnosticreport
InstanceOf: MRIDiagnosticReport
Usage: #example
Description: "דוגמה למשאב דוח אבחון מינימלי התואם את צורכי מדידת ה-MRI."
* status = #final
* code = MedicalServiceMoH#74181 "MRI בטן, לנבדק ליום"
* issued = "2013-04-05T13:28:17.239+02:00"
