working directory
getCwdForPath: aPathString

	| prefix |
	prefix := (self splitLocationPrefixFromPath: aPathString) first.
	^ prefix isEmpty
		ifTrue: [self workingDirectory]
		ifFalse: [self cwdDictionary at: prefix ifAbsentPut: [self defaultPathFor: aPathString]]
