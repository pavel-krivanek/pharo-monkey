initialize-release
openLabel: aString 

	| tty |
	tty := CommandShellTranscript commandShell: self.
	tty openLabel: aString.
	^ tty

