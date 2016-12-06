private - forked image
serialize: anObject
	| serializer newClasses |
	
	self resultFile ensureDelete.
	newClasses := self newlyAddedBehaviors.
	
	"use a custom serializer that also serializes newly created classes"
	serializer := FLSerializer newDefault.
	
	serializer analyzer 
		considerInternalAllBehaviors: newClasses.
	serializer
		"Even so they newClasses are specified above, they have to be includede explitely in the output"
		serialize: anObject, newClasses
		toFileNamed: self resultFile fullName.
	