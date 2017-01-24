converting
asAbsoluteInDirectory: directory
	
	| fileReference |
	fileReference := name asFileReference.
	fileReference isAbsolute ifTrue: [ ^ fileReference ].
	
	^ directory / name