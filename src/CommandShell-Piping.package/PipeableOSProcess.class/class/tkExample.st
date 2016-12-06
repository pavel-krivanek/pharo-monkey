examples
tkExample
	"Start an interactive Tk shell and send it some commands to display a user interface."

	"PipeableOSProcess tkExample"

	| wish |
	wish :=  self wish.
	[wish
		exec: 'button .b1 -text "This is button b1"';
		exec: 'button .b2 -text "This is button b2"';
		exec: 'button .exit -text Exit -command exit';
		exec: 'pack .b1 .b2 .exit'] fork.
	^ wish
