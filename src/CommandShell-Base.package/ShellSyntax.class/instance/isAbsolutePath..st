platform dependent
isAbsolutePath: aPathString
	"Answer true if aPathString is specified relative to the root of the file system."

	"ShellSyntax new isAbsolutePath: 'not/absolute/path'"
	"ShellSyntax new isAbsolutePath: '/absolute/path'"
	"ShellSyntax new isAbsolutePath: '/'"
	"ShellSyntax new isAbsolutePath: 'C:\'"
	"ShellSyntax new isAbsolutePath: '\'"
	"ShellSyntax new isAbsolutePath: 'C:'"
	"ShellSyntax new isAbsolutePath: 'C:WINDOWS'"
	"ShellSyntax new isAbsolutePath: 'C:\WINDOWS'"

	| prefixAndPath path |
	^ ((((CommandShell pathSeparator, '*') match: aPathString)
		or:	[prefixAndPath := self splitLocationPrefixFromPath: aPathString.
			(CommandShell pathSeparator, '*') match: (path := prefixAndPath last)])
				or: [prefixAndPath first isEmpty not and: [path isEmpty]]) "One above the root of a Win32 file system tree"
