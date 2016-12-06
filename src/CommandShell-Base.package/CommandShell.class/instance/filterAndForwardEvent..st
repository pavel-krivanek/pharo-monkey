input character filtering
filterAndForwardEvent: keyboardEvent 
	"Filter keyboardEvent, taking special action if needed. If a child process
	is active, forward keyboardEvent to the child and answer nil. Otherwise
	answer keyboardEvent."

	(keyboardConnector isNil or: [keyboardConnector closed])
		ifTrue: [^ keyboardEvent]
		ifFalse: [keyboardConnector
					nextPut: keyboardEvent keyValue asCharacter;
					flush.
			^ nil]