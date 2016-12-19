*CI-Obsolete
processScript

	<argument>

	^ ((self argumentAt: 1) = 'script')
		ifTrue: [ 
			self setUpScript.
			self dispatchSubScriptCommand. ]
		ifFalse: [ nil ].
	
