model protocol
codePaneMenu: aMenu shifted: shifted
	"Note that unless we override perform:orSendTo:, PluggableTextController will respond
	to all menu items.

	If StringHolder is not present, try to delegate to Workspace instead."

	^ (Smalltalk
		at: #StringHolder
		ifAbsent: [Smalltalk
				at: #Workspace
				ifAbsent: [^ self ]]) basicNew codePaneMenu: aMenu shifted: shifted