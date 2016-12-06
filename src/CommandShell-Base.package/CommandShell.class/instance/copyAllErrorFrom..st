event handling
copyAllErrorFrom: aProxy
	"An event driven data source may send this message to cause its available
	error stream characters to be processed."

	| s |
	self readSyncSemaphore critical:
		[s := aProxy errorUpToEnd.
		s isEmpty ifFalse:
			[[self errorStream nextPutAll: s]
				on: Error
				do: [:ex | ex retryUsing:
						["If the error pipe overflows we get an unhandled error,
						so wait a while and retry the write."
						(Delay forMilliseconds: self pollingDelayTime) wait.
						self errorStream nextPutAll: s]]]]
