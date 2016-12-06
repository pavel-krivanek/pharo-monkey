utility
wish
	"Start a Tk/Tcl command interpreter"

	"self wish"

	| proxyClass |
	(proxyClass := self externalProxyClass) ifNotNil:
		[^ self command: proxyClass tkShellPath].
	^ self notify: 'OSProcess not available'
