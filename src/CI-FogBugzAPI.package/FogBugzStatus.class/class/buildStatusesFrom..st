instance creation
buildStatusesFrom: aString
	| xml | 

	xml := Soup fromString: aString.
	^ (xml findAllTags: 'status') collect: [ :node| self fromXML: node ]