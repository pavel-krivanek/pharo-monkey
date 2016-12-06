working directory
workingDirectory

	^ self cwdDictionary at: self cwdIndex ifAbsentPut:
		[Smalltalk at: #OSProcess ifPresent: [:osp | osp thisOSProcess getCwd]]
