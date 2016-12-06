path name expansion
expandedPathsFromRelativePath: aPathString beginningAt: firstPartOfPath
	"Answer a collection of all paths which match aPathString. Expand the path relative to firstPartOfPath."

	 "ShellSyntax new expandedPathsFromRelativePath: 'e*c/h*s' beginningAt: '/'"
	 "ShellSyntax new expandedPathsFromRelativePath: 'usr/b?n/vi' beginningAt: '/'"
	 "ShellSyntax new expandedPathsFromRelativePath: 'bin/vi' beginningAt: '/usr'"
	 "ShellSyntax new expandedPathsFromRelativePath: 'usr/*/vi' beginningAt: nil"
	 "ShellSyntax new expandedPathsFromRelativePath: 'usr/bin/../bin/./../bin/../../usr/bin/vi' beginningAt: '/'"
	 "ShellSyntax new expandedPathsFromRelativePath: 'bin/../bin/./../bin/../../usr/bin/vi' beginningAt: '/usr'"
	 "ShellSyntax new expandedPathsFromRelativePath: '../../../../../../usr/bin/vi' beginningAt: '/'"
	 "ShellSyntax new expandedPathsFromRelativePath: '*.image' beginningAt: nil"
	 "ShellSyntax new expandedPathsFromRelativePath: '*.*' beginningAt: 'C:\WINDOWS'"

	| result pathParts root |
	result := OrderedCollection new.
	pathParts := aPathString findTokens: CommandShell pathSeparator.
	root := firstPartOfPath isNil
				ifTrue: [CommandShell defaultPathString]
				ifFalse: [firstPartOfPath].
	result addAll: (self expandPathParts: pathParts beginningAt: root).
	^ result

