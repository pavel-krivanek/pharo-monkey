initialize-release
open

	| tty |
	tty := CommandShellTranscript commandShell: self.
	tty open.
	^ tty

