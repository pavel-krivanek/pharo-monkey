accessing
classForEncoding: anEncodingName
	^ self encodingNamesAndClassesCache
		at: anEncodingName
		ifAbsentPut: [self findClassForEncoding: anEncodingName]