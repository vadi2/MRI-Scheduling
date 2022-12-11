CodeSystem: MRIConfirmationCodeSystem
Id: mri-confirmation
Title: "סטטוס אישור MRI"
Description: "סטטוס אישור MRI על ידי קופת החולים. ניתן להכליל לפרוצדורות אחרות לפי בקשה"
* ^caseSensitive = true
* ^experimental = false

* #undecided "טרם התקבלה החלטה"
* #approved "הבקשה אושרה"
* #rejected "הבקשה נדחתה"

ValueSet: MRIConfirmationVS
Id: MRIConfirmationVS
Title: "סטטוס אישור MRI על ידי קופת החולים"
Description: "סטטוס אישור MRI על ידי קופת החולים. ניתן להכליל לפרוצדורות אחרות לפי בקשה"
* ^experimental = false
* include codes from system MRIConfirmationCodeSystem
