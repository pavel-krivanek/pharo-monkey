path name expansion
firstExpandedArgument: aString inDirectoryPath: aPath
	"Expand a single argument and answer a fully qualified path to the first matching
	name. If no match, answer the literal path and file name (which does not exist).
	If aString is nil, answer an empty string. This method may be used to expand a single
	argument, such as the target for a command output redirection, where the target is
	expected to resolve to a single file name."

	"ShellSyntax new firstExpandedArgument: 'b?*h' inDirectoryPath: '/usr/bin'"
	"ShellSyntax new firstExpandedArgument: 'b?*h' inDirectoryPath: '/no/such/directory'"
	"ShellSyntax new firstExpandedArgument: 'no*such*file???' inDirectoryPath: '/usr/bin'"
	"ShellSyntax new firstExpandedArgument: '/usr/bin/vi' inDirectoryPath: '/usr/bin'"
	"ShellSyntax new firstExpandedArgument: '../bin/vi' inDirectoryPath: '/usr/bin'"
	"ShellSyntax new firstExpandedArgument: '../b?n' inDirectoryPath: '/usr/bin'"
	"ShellSyntax new firstExpandedArgument: nil inDirectoryPath: '/usr/bin'"

	| expanded path trimmedString |
	aString ifNil: [^ ''].
	trimmedString := CommandShell withBlanksTrimmed: aString.
	expanded := self expandArgument: trimmedString inDirectoryPath: aPath.
	path := expanded isEmpty
			ifTrue: [trimmedString]
			ifFalse: [expanded first].
	^ self newPathFor: path fromDefault: aPath
