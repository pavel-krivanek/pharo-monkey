input character filtering
doInterrupt
	"Interrupt character detected, do interrupt stuff."

	| msgStrm children answer |
	children := self externalChildren collect: [:e | e processProxy].
	(children size > 0)
		ifTrue:
			[msgStrm := WriteStream on: String new.
			(children size > 1)
				ifTrue: [msgStrm nextPutAll: 'kill processes']
				ifFalse: [msgStrm nextPutAll: 'kill process'].
			children do: [:e | msgStrm nextPutAll: ' ', e pid printString, ' (', e programName, ')'].
			msgStrm nextPut: $?.
			self readSyncSemaphore critical:
				[self pauseStProcesses.
				answer := self confirm: msgStrm contents.
				self unpauseStProcesses.
				answer ifTrue:
					[children reverseDo: [:e | e sigkill].
					self terminateStProcesses]]]
