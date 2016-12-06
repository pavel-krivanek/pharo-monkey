accessing
textConverterClassForEncoding: anEncodingName
	^ self encodingNamesAndTextConverterClassesCache
		at: anEncodingName
		ifAbsentPut: [self findTextConverterClassForEncoding: anEncodingName]