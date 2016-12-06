accessing
cwdDictionary
	"Current working directory paths indexed by device or file system name"

	^ cwdDictionary ifNil: [cwdDictionary := Dictionary new]
