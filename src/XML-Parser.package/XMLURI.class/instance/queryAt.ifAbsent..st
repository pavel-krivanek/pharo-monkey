accessing
queryAt: aKey ifAbsent: aBlock
	^ self percentAndPlusDecoded:
		(self rawQuery
			at: aKey
			ifAbsent: [^ aBlock value])