tests
testQueryAtIfAbsent
	self allURIStringsDo: [:each | | uri |
		uri := each asXMLURI.
		uri query keysAndValuesDo: [:key :value |
			self assert: (uri queryAt: key) = value.
			self assert:
				(uri
					queryAt: key
					ifAbsent: [self fail]) = value].
		self assert:
			(uri
				queryAt: 'absentKey'
				ifAbsent: ['absentValue']) = 'absentValue']