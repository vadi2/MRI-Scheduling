Instance: DebugBundleMinimalExamples
InstanceOf: Bundle
Usage: #example
Title: "Bundle all of the minimal examples"
Description: "Bundle of all of the minimal examples, aggregated together for uploading to a FHIR server or used in visualisation"
* type = #transaction

// commented out by default due to missing fullUrl's

// * entry[+]
//   * request.url = "Patient/minimal-patient"
//   * request.method = #PUT
//   * resource = minimal-patient

// * entry[+]
//   * request.url = "Organization/minimal-hmo"
//   * request.method = #PUT
//   * resource = minimal-hmo

// * entry[+]
//   * request.url = "Organization/minimal-provider"
//   * request.method = #PUT
//   * resource = minimal-provider

// * entry[+]
//   * request.url = "Procedure/minimal-procedure"
//   * request.method = #PUT
//   * resource = minimal-procedure
