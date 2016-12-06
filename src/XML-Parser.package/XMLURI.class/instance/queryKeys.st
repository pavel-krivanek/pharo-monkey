accessing
queryKeys
	^ self rawQuery keys collect: [:each | self percentAndPlusDecoded: each]