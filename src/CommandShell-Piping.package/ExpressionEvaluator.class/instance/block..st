initialize - release
block: aBlock

	self evaluationBlock: aBlock.
	self initialize.
	self prepareOutputForInternalReader
