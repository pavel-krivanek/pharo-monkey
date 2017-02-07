helpers
bashPathOf: aFileReference relativeTo: parentPath
	
	| path |
	path := aFileReference.
	aFileReference basename = '*' ifTrue: [
		path := aFileReference copy.
		path := path parent / '.'
	].
	^ path isAbsolute ifTrue: [ 
		path fullName
	] ifFalse: [
		(parentPath / path gtDisplayString) fullName
	]