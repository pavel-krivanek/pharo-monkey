status
beSuccess

	self changeStatusFileDoing: [ :str | str nextPutAll: 'SUCCESS' ]