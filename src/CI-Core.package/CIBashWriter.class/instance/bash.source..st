high-level
bash: aCommand source: aBoolean

	self
		writeCommand: '{1} {2}'
		format: { 
			aBoolean
				ifTrue: [ '.' ]
				ifFalse: [ ''].
			aCommand }