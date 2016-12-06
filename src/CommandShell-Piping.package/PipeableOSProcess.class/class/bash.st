utility
bash
	"Start a Gnu bash command interpreter (enhanced Unix shell)"

	"self bash"
	"self bash exec: 'ls'; exec: 'who'; close; upToEnd"

	| proxyClass |
	(proxyClass := self externalProxyClass) ifNotNil:
		[^ self command: proxyClass bashShellPath].
	^ self notify: 'OSProcess not available'
