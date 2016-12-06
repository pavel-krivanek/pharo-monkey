working directory
cwdIndexFor: aPathStringWithPrefix
	"Answer key to use for aPathStringWithPrefix"

	| prefix |
	prefix := (self splitLocationPrefixFromPath: aPathStringWithPrefix) first.
	^ prefix isEmpty
		ifTrue: [#default]
		ifFalse: [prefix]