instance creation
fromXML: xml
	| status |
	
	status := self 
		id: (xml findTag: 'ixstatus') next text asInteger
		name: (xml findTag: 'sstatus') next text.
		
	(Boolean readFrom: (xml findTag: 'fdeleted') next text readStream)
		ifTrue: [ status beDeleted ].
		
	^ status