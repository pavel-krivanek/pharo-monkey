tests
testQueryKeys
	self allURIStringsDo: [:each | | uri |
		uri := each asXMLURI.
		self assert: uri queryKeys asArray = uri query keys asArray]