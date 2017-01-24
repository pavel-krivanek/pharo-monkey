accessing
baseDirectory

	| workingDirectory |
	workingDirectory := OSPlatform current environment getEnv: 'PWD'.
	^ workingDirectory asFileReference / 'monkey-build'