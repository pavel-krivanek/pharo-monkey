state-transition
changeStateFileDoing: aBlock

	self stateFile ensureDelete.
	self stateFile writeStreamDo: aBlock