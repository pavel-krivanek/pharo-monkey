utility
xterm: aCommandString
	"Convenience method for running a command in an external xterm window"

	"self xterm: 'top -d 2'"

	^ self command: 'xterm -T ''', aCommandString, ''' -e ', aCommandString