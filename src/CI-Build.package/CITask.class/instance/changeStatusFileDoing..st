status
changeStatusFileDoing: aBlock

	self statusFile ensureDelete.
	self statusFile writeStreamDo: aBlock