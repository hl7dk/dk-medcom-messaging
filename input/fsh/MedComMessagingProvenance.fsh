Profile: MedComMessagingProvenance
Parent: Provenance
Id: medcom-messaging-provenance
Description: "Provenance information about the messages preceeding the current message"
* target 1..1 MS
* target only Reference(MedComMessagingMessageHeader)
* target ^short = "Targets the MedComMessagingMessageHeader from the previous message."
* occurredDateTime 1.. MS
* occurredDateTime ^short = "A human readable date and time for when the message is sent. Shall include a date, a time and timezone."
* recorded MS
* recorded ^short = "A system readable date and time for when the message is sent."
* activity 1.. MS
* activity from MedComMessagingActivityCodesValueset
* activity ^definition = "Activity that occurred and triggered the current or a previous message"
* activity.coding 1.. MS
* activity.coding.code 1.. MS
* activity.coding.code ^definition = "The activity defined by the system"
* agent 1.. MS
* agent ^short = "The actors involved in the activity taking place"
* agent.who 1.. MS
* agent.who only Reference(MedComMessagingOrganization)
* agent.who ^type.aggregation = #bundled
* agent.who ^definition = "Shall contain the messaging organization performing the activity. This also apply to an internal transmission to another messaging organization within a given system."
* agent.who ^short = "A reference to the actor of the activity, which shall be a MedComMessagingOrganization. If more actors has been involved, the element must be sliced."
* entity MS
* entity ^definition = "Shall only be included if the current message is a response to a previous message."
* entity.role MS
* entity.role ^short = "When a message is a response, a correction or a forwarding message the role shall be 'revision' and when the message is a cancellation the role shall be 'removal'."
* entity.what MS
* entity.what ^short = "A reference to the previous message. If the previous message is a FHIR message, the reference element must be used and if the previous message is an EDIFACT or OIOXML, the identifier element must be used."
* entity.what.identifier MS
* entity.what.identifier ^definition = "Shall contain the message header id of messages given as input to the activity if the previous message is not a fhir message"
* entity.what.identifier ^short = "If previous message is EDIFACT or OIOXML, this element must be expressed as [lokationsnummer]#[brevid] from the EDIFACT or OIOXML message."
* entity.what.reference MS
* entity.what.reference ^definition = "Shall contain the message header id of messages given as input to the activity"
* entity.what.reference ^short = "If the previous message is a FHIR message, this element must hold the MessageHeader.id from previous message."
* text MS

// CareCommunication new-message example
Instance: 9c284936-5454-4116-95fc-3c8eeeed2400
InstanceOf: MedComMessagingProvenance
Title: "CareCommunication example. The Provenance instance is only valid if used in a bundle (message) - new message"
Description: "CareCommunication example. The Provenance instance is only valid if used in a bundle (message) - new message"
Usage: #example
* target = Reference(42c01434-8feb-11ec-b909-0242ac120002)
* occurredDateTime = 2020-09-28T12:34:56Z
* recorded = 2020-09-28T12:34:56Z
* activity.coding = $activityCodes#new-message
* agent.who = Reference(d7056980-a8b2-42aa-8a0e-c1fc85d1f40d)