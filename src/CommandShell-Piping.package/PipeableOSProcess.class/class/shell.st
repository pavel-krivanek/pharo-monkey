utility
shell
	"Start a Unix shell"

	"self shell"
	"self shell exec: 'ls'; exec: 'who'; close; upToEnd"

	| proxyClass |
	(proxyClass := self externalProxyClass) ifNotNil:
		[^ self command: proxyClass defaultShellPath].
	^ self notify: 'OSProcess not available'
