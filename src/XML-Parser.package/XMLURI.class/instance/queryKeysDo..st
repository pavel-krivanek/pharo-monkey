enumerating
queryKeysDo: aBlock
	self rawQuery keysDo: [:each |
		aBlock value: (self percentAndPlusDecoded: each)]