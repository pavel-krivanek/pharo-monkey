event handling
copyAllOutputFrom: aProxy
	"An event driven data source may send this message to cause its available
	characters to be processed."

	| s |
	self readSyncSemaphore critical:
		[s := aProxy upToEnd.
		s isEmpty ifFalse:
			[[self outputStream nextPutAll: s]
				on: Error
				do: [:ex | ex retryUsing:
						["If the output pipe overflows we get an unhandled error,
						so wait a while and retry the write."
						(Delay forMilliseconds: self pollingDelayTime) wait.
						self outputStream nextPutAll: s]]]]
