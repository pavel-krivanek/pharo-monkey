initialize-release
clearSemaphore

	[self readSyncSemaphore isEmpty] whileFalse: [readSyncSemaphore terminateProcess].
	readSyncSemaphore signal
