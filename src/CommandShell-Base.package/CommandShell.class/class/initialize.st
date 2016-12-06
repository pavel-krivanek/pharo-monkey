class initialization
initialize

	"CommandShell initialize"

	| preferencesClass |
	Smalltalk addToStartUpList: self.
	(Smalltalk hasClassNamed: #Preferences)
		ifTrue: ["Pharo deprecates Preference in favor of pragma registration mechanism"
			preferencesClass := Smalltalk at: #Preferences.
			(preferencesClass respondsTo: #setWindowColorFor:to: )
				ifTrue: ["Squeak"
					preferencesClass 
						setWindowColorFor: #CommandShell 
						to: (Color colorFrom: self windowColorSpecification pastelColor)]
				ifFalse: ["Pharo images use some other preferences protocol"]].
	Smalltalk at: #TheWorldMenu ifPresent: [ :class |
		class class methodDict at: #registerOpenCommand: ifPresent: [ :method |
			(method hasLiteral: #deprecated:) "n.b.  use #hasLiteral: rather than #sendsSelector: for Squeak 3.8"
				ifTrue: ["Pharo issues deprecation and tells you to do it their way. Ignore the warning."]
				ifFalse: [ class unregisterOpenCommand: 'Squeak shell'. "if previously registered"
					class registerOpenCommand: {'Squeak Shell'. {CommandShell . #open}}]]]
