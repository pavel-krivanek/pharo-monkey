platform dependent
pathAboveRoot
	"Answer a path pointing to a location above the file system root. The
	pathStringAboveRoot string refers to this location."

	 "ShellSyntax new pathAboveRoot"

	^ (self platformName = 'Win32')
		ifTrue: ['']
		ifFalse: [CommandShell pathSeparator].
