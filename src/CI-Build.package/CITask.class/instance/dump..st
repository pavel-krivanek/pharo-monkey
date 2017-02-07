convenience
dump: aFile

	self addStep: (CIDumpStep files: { aFile })