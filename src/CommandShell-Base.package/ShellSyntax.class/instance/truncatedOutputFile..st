command string parsing
truncatedOutputFile: fileName
	"Attempt to do reasonable things to open a file of size zero. Better would be
	to implement a file truncation primitive."

	"ShellSyntax new truncatedOutputFile: '/tmp/delete.me'"
	"ShellSyntax new truncatedOutputFile: '/dev/null'"

	| strm |
	[strm := FileStream concreteStream forceNewFileNamed: fileName]
		on: Error
		do: [:ex | ^ FileStream fileNamed: fileName].
	^ strm
