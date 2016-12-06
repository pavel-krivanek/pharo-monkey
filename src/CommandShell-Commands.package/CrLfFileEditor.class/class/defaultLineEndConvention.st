private
defaultLineEndConvention
	"FIXME: The Unix and Win32 are right, but I just guessed at the others - dtl"

	| platform |
	platform :=  ShellSyntax new platformName.
	(platform = 'unix') ifTrue: [^ #lf].
	(platform = 'Win32') ifTrue: [^ #crlf].
	(platform = 'Mac OS') ifTrue: [^ #cr].
	(platform = 'RiscOS') ifTrue: [^ #cr].
	(platform = 'OS2') ifTrue: [^ #crlf]. "FIXME: Is this the right name for OS2?"
	"Add other system types here..."
	^ #cr
