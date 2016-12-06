class initialization
unload
	Smalltalk at: #TheWorldMenu ifPresent: [ :class |
		class class methodDict at: #unregisterOpenCommandWithReceiver: ifPresent: [ :method |
			(method hasLiteral: #deprecated:) "n.b.  use #hasLiteral: rather than #sendsSelector: for Squeak 3.8"
				ifFalse: [ class unregisterOpenCommandWithReceiver: self ] ] ]