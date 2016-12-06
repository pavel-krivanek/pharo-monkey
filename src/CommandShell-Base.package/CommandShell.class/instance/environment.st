accessing
environment

	^ environment ifNil:
		[environment := (Smalltalk at: #OSProcess ifPresent:
			[:osp | osp thisOSProcess environment deepCopy]) ifNil: [Dictionary new]].
