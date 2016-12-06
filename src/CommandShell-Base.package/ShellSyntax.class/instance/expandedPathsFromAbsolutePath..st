path name expansion
expandedPathsFromAbsolutePath: anAbsolutePathString
	"Answer a collection of all paths which match anAbsolutePathString."

	 "ShellSyntax new expandedPathsFromAbsolutePath: '/e*c/h*s'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: 'e*c/h*s'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: '/usr/bin/vi'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: 'bin/vi'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: '/usr/*/vi'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: '/usr/bin/../bin/./../bin/../../usr/bin/vi'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: '/bin/../bin/./../bin/../../usr/bin/vi'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: '/usr/bin/../bin/./../bin/../../../../../usr/bin/vi'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: '../../../../../../usr/bin/vi'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: '/'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: '*.image'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: 'C:\WINDOWS\*.*'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: '*.*'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: 'C:\*.*'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: 'C:\CONFIG.*'"
	 "ShellSyntax new expandedPathsFromAbsolutePath: 'C:\CONFIG.*'"

	| result pathParts a prefix dirPathString root |
	result := OrderedCollection new.
	a := self splitLocationPrefixFromPath: anAbsolutePathString.
	prefix := a at: 1.
	dirPathString := a at: 2.
	pathParts := dirPathString findTokens: CommandShell pathSeparator.
	root := prefix, CommandShell pathSeparator.
	result addAll: (self expandPathParts: pathParts beginningAt: root).
	^ result

