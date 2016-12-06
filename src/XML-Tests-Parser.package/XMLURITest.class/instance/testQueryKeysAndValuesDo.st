tests
testQueryKeysAndValuesDo
	self allURIStringsDo: [:each | | uri visited |
		uri := each asXMLURI.
		visited := OrderedCollection new.
		uri queryKeysAndValuesDo: [:key :value |
			visited addLast: key -> value].
		self assert: visited = uri query associations asOrderedCollection]