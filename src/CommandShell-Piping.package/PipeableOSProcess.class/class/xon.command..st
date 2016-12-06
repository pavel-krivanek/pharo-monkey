utility
xon: remoteSystem command: aCommandString
	"Convenience method for running an X program on a remote system and displaying its window
	on the local display."

	"self xon: 'someRemoteHost' command: 'xeyes'"

	^ self command: 'xon ', remoteSystem, ' ', aCommandString
