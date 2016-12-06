initialize
initialize

	super initialize.
	baseFile :=  Time primUTCMicrosecondsClock  asString asFileReference / Smalltalk imageFile nextVersion basenameWithoutExtension.
	timeout := 20 minutes.
	timeoutBlock := [ ].