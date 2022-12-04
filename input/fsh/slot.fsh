Profile: MRISlot
Parent: Slot
Id: mri-slot
Title: "MRI Slot"
Description: "מטרת הפרופיל היא משבצת זמן פנויה או משומשת להליך MRI, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* schedule and status and start and end MS
* extension contains MRIFirstChosenSlot named firstChosenSlot 0..1 MS
* schedule.display = "not used"


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

Instance: first-available-slot
InstanceOf: MRISlot
Usage: #example
Title: "first-available-slot"
Description: "(see `start`) משבצת פנויה ראשונה לתיאום פגישה"
* meta.profile = Canonical(MRISlot)
* status = #free
* start = "2022-11-28T13:15:00+02:00"
* end = "2022-11-28T15:00:00+02:00"
* schedule.display = "not used"

Instance: first-chosen-slot
InstanceOf: MRISlot
Usage: #example
Title: "first-chosen-slot"
Description: "(see `status = busy` and `start`) משבצת ראשונה נבחרה לפגישה"
* meta.profile = Canonical(MRISlot)
* extension[+].url = Canonical(MRIFirstChosenSlot)
* extension[=].valueBoolean = true
* status = #busy
* start = "2022-11-28T16:00:00+02:00"
* end = "2022-11-28T16:45:00+02:00"
* schedule.display = "not used"

Instance: third-available-slot
InstanceOf: MRISlot
Usage: #example
Title: "third-available-slot"
Description: "משבצת שלישית פנויה לפגישה שלא נבחרה"
* meta.profile = Canonical(MRISlot)
* status = #free
* start = "2022-11-29T10:00:00+02:00"
* end = "2022-11-29T10:45:00+02:00"
* schedule.display = "not used"
