private - forked image
newlyAddedBehaviors
	"Return the newly added behaviors (non-obsolete classes and traits) since the last #recordSystemGlobals call"

	| newClasses limit superclasses |
	newClasses := self newlyAddedGlobals select: [ :each |
		(each isBehavior or: [ each isTrait ]) and: [ each isObsolete not ] ].

	"Collect superclasses so that instance variable modifications in superclasses are also
	serialized. We need this because the format of a superclass may have changed which will
	result in a format mismatch when materializing."
	limit := { Trait. Object. TestCase }.
	superclasses := OrderedCollection new.
	(newClasses do: [ :class |
		| currentClass |
		currentClass := class superclass.
		[ limit includes: currentClass ] whileFalse: [
			superclasses add: currentClass.
			currentClass := currentClass superclass ] ]).
	
	^ newClasses, superclasses