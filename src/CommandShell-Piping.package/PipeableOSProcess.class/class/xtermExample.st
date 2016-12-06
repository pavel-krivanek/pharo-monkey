examples
xtermExample
	"Open an external xterm window running a 'top' command. Works on unix
	X window platforms."

	"self xtermExample"

	^ self xterm: 'top -d 2'