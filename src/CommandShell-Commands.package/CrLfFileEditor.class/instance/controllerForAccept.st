menus
controllerForAccept
	"Find the controller or morph which expects the #accept message"

	| controller view |
	CommandShell isMorphic
		ifTrue:
			[controller := dependents detect: [:e | e respondsTo: #accept] ifNone: [nil]]
		ifFalse:
			[view := dependents detect: [:e | e controller respondsTo: #accept] ifNone: [nil].
			controller := view isNil
				ifTrue: [nil]
				ifFalse: [view controller]].
	^ controller