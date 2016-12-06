accessing
runState

	^ runState ifNil: [runState := #notYetRunning]
