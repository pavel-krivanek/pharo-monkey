enumerating
queryKeysAndValuesDo: aTwoArgumentBlock
	self rawQuery keysAndValuesDo: [:key :value |
		aTwoArgumentBlock
			value: (self percentAndPlusDecoded: key)
			value: (self percentAndPlusDecoded: value)]