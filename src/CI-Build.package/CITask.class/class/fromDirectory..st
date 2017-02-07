instance-creation
fromDirectory: aDirectory
	
	^ self fromMonkeyFile: (aDirectory asFileReference / 'build.monkey')