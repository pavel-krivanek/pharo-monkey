path name expansion
expandedPathsFrom: aPathString beginningAt: firstPartOfPath
	"Answer a collection of all paths which match aPathString. If aPathString is a relative path,
	expand the path relative to firstPartOfPath."

	 "ShellSyntax new expandedPathsFrom: '/e*c/h*s' beginningAt: nil"
	 "ShellSyntax new expandedPathsFrom: 'e*c/h*s' beginningAt: '/'"
	 "ShellSyntax new expandedPathsFrom: '/usr/bin/vi' beginningAt: nil"
	 "ShellSyntax new expandedPathsFrom: 'bin/vi' beginningAt: '/usr'"
	 "ShellSyntax new expandedPathsFrom: '/usr/*/vi' beginningAt: nil"
	 "ShellSyntax new expandedPathsFrom: '/usr/bin/../bin/./../bin/../../usr/bin/vi' beginningAt: nil"
	 "ShellSyntax new expandedPathsFrom: '/bin/../bin/./../bin/../../usr/bin/vi' beginningAt: '/usr'"
	 "ShellSyntax new expandedPathsFrom: '/usr/bin/../bin/./../bin/../../../../../usr/bin/vi' beginningAt: nil"
	 "ShellSyntax new expandedPathsFrom: '../../../../../../usr/bin/vi' beginningAt: nil"
	 "ShellSyntax new expandedPathsFrom: '/' beginningAt: '/'"
	 "ShellSyntax new expandedPathsFrom: '*.image' beginningAt: nil"
	 "ShellSyntax new expandedPathsFrom: 'C:\WINDOWS\*.*' beginningAt: nil"
	 "ShellSyntax new expandedPathsFrom: '*.*' beginningAt: 'C:\WINDOWS'"
	 "ShellSyntax new expandedPathsFrom: 'C:\*.*' beginningAt: nil"
	 "ShellSyntax new expandedPathsFrom: 'C:\CONFIG.*' beginningAt: nil"
	 "ShellSyntax new expandedPathsFrom: 'C:\CONFIG.*' beginningAt: '\'"

	^ (self isAbsolutePath: aPathString)
		ifTrue: [self expandedPathsFromAbsolutePath: aPathString]
		ifFalse: [self expandedPathsFromRelativePath: aPathString beginningAt: firstPartOfPath]
