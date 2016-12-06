tests
testQueryAt
	self allURIStringsDo: [:each | | uri |
		uri := each asXMLURI.
		uri query keysAndValuesDo: [:key :value |
			self assert: (uri queryAt: key) = value].
		self assert: (uri queryAt: 'absent') = '']