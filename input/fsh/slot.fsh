Profile: MRISlot
Parent: Slot
Id: mri-slot
Title: "MRI Slot"
Description: "מטרת הפרופיל היא משבצת זמן פנויה או משומשת להליך MRI, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* schedule and status and start and end MS
* extension contains MRIFirstChosenSlot named firstChosenSlot 0..1 MS

Extension: MRIFirstChosenSlot
Id: first-chosen-slot
Title: "FirstChosenSlot"
Description: "First slot that was chosen by the patient"
* value[x] only boolean


Mapping: MRISlotToGertner
Source: MRISlot
Target: "http://www.gertnerinst.org.il"
Id: SlotMapping
Title: "מיפוי של משבצת זמן בודדת הזמינה לפגישה למודל נתוני רשימת המתנה MRI של גרטנר."
* start -> "MRI_first_available_date"
* extension[firstChosenSlot] -> "MRI_first_chosen_date"

Instance: minimal-schedule
InstanceOf: Schedule
Usage: #example
Title: "minimal-schedule"
Description: "תזמן משאב לדוגמה לקיבוץ משאבי חריץ"
* actor = Reference(minimal-patient)

Instance: first-available-slot
InstanceOf: Slot
Usage: #example
Title: "first-available-slot"
Description: "(see `start`) משבצת פנויה ראשונה לתיאום פגישה"
* meta.profile = Canonical(MRISlot)
* schedule = Reference(minimal-schedule)
* status = #free
* start = "2022-11-28T13:15:00+02:00"
* end = "2022-11-28T15:00:00+02:00"
* schedule = Reference(minimal-schedule)

Instance: first-chosen-slot
InstanceOf: Slot
Usage: #example
Title: "first-chosen-slot"
Description: "(see `status = busy` and `start`) משבצת ראשונה נבחרה לפגישה"
* meta.profile = Canonical(MRISlot)
* extension[+].url = Canonical(MRIFirstChosenSlot)
* extension[=].valueBoolean = true
* schedule = Reference(minimal-schedule)
* status = #busy
* start = "2022-11-28T16:00:00+02:00"
* end = "2022-11-28T16:45:00+02:00"
* schedule = Reference(minimal-schedule)

Instance: third-available-slot
InstanceOf: Slot
Usage: #example
Title: "third-available-slot"
Description: "משבצת שלישית פנויה לפגישה שלא נבחרה"
* meta.profile = Canonical(MRISlot)
* schedule = Reference(minimal-schedule)
* status = #free
* start = "2022-11-29T10:00:00+02:00"
* end = "2022-11-29T10:45:00+02:00"
* schedule = Reference(minimal-schedule)
