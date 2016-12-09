instance creation
on: aDirectoryFileReference

	| files |
	
	files := (aDirectoryFileReference childrenMatching: '*.xml') select: #isFile.
	
	files collect: [ :file | self validate: file readStream ].
	

		