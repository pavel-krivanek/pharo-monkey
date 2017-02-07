executing
dumpFile: aFile

	| fileToDump |
	fileToDump := aFile asFileReference.
	fileToDump isAbsolute ifFalse: [ 
		fileToDump := (CIUtils pwd fullName, '/', aFile asFileReference gtDisplayString) asFileReference.
	].
	self dumpFileAbsolute: fileToDump