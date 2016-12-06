tests
testQueryKeysDo
	self allURIStringsDo: [:each | | uri visited |
		uri := each asXMLURI.
		visited := OrderedCollection new.
		uri queryKeysDo: [:key |
			visited addLast: key].
		self assert: visited = uri query keys asOrderedCollection]