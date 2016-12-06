examples
remoteShellExample: remoteUnixHostName
	"Start a shell on another computer using rsh, and answer the the output
	of some commands on the remote host. You must have security access to
	the remote system in order for this to work."

	"PipeableOSProcess remoteShellExample: 'minnow.cc.gatech.edu'"
	"PipeableOSProcess remoteShellExample: 'micron'"
	"PipeableOSProcess remoteShellExample: 'localhost'"

	| rsh output |
	rsh :=  self remoteShell: remoteUnixHostName.
	rsh exec: 'echo remote host name is '.
	rsh exec: 'hostname'.
	rsh exec: 'exit'.
	output := rsh output.
	rsh close.
	rsh succeeded
		ifTrue: [self notify: output]
		ifFalse: [self notify: 'remote shell failed with error message: ', rsh errorUpToEnd].
	^ rsh
