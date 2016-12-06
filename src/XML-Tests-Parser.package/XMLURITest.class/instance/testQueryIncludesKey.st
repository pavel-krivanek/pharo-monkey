tests
testQueryIncludesKey
	self allURIStringsDo: [:uriString | | uri |
		uri := uriString asXMLURI.
		uri query keysDo: [:each |
			self assert: (uri queryIncludesKey: each)].
		self deny: (uri queryIncludesKey: 'absent')]