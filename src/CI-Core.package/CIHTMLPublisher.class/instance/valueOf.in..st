helper
valueOf: name in: context
	self flag: #todo. "This is a WORKAROUND because there is a bug in the compiler, and is throwing 
	an error in certain (unknown) conditions. This needs to be revisited, eventually."
	^ [ (context tempNamed: name) printStringLimitedTo: 50 ]
		on: Error do: [ :e | '(unknown)' ] 