state-transition
beSuccess

	self changeStateFileDoing: [ :str | str nextPutAll: 'SUCCESS' ]