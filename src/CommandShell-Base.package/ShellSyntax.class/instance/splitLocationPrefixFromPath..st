platform dependent
splitLocationPrefixFromPath: aPathString
	"Split any leading prefix from a path string, such as the C: device name
	for Win32. Answer an Array with prefix and path."

	 "ShellSyntax new splitLocationPrefixFromPath: 'C:\u'"
	 "ShellSyntax new splitLocationPrefixFromPath: 'C:\'"
	 "ShellSyntax new splitLocationPrefixFromPath: 'C:'"
	 "ShellSyntax new splitLocationPrefixFromPath: 'C:u'"
	 "ShellSyntax new splitLocationPrefixFromPath: 'c:u'"
	 "ShellSyntax new splitLocationPrefixFromPath: '\u'"

	| prefix path |
	(self platformName = 'Win32')
		ifTrue:
			[((aPathString at: 2 ifAbsent: []) == $:)
				ifTrue:
					[prefix := (String new: 2).
					prefix at: 1 put: (aPathString at: 1) asUppercase.
					prefix at: 2 put: $:.
					path := aPathString copyAfter: $:]
				ifFalse:
					[prefix := ''.
					path := aPathString]]
		ifFalse:
			[prefix := ''.
			path := aPathString].
	^ Array with: prefix with: path
