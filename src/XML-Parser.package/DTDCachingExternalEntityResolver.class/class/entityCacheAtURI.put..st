accessing
entityCacheAtURI: anXMLURIOrURIString put: aReplacement
	^ self entityCache
		at: anXMLURIOrURIString asXMLURI
		put: aReplacement