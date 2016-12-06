class initialization
initialize

	"CrLfFileEditor initialize"

	| preferencesClass |
	(Smalltalk hasClassNamed: #Preferences)
		ifTrue: ["Pharo deprecates Preference in favor of pragma registration mechanism"
			preferencesClass := Smalltalk at: #Preferences.
			(preferencesClass respondsTo: #setWindowColorFor:to: )
				ifTrue: ["Squeak"
					preferencesClass 
						setWindowColorFor: #CommandShell 
						to: (Color colorFrom: self windowColorSpecification pastelColor)]
				ifFalse: ["Pharo images use some other preferences protocol"]].
