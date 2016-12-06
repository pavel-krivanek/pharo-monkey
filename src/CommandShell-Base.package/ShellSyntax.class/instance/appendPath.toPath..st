path name expansion
appendPath: aPathString toPath: startingPathString 
	"ShellSyntax new appendPath: 'hosts' toPath: '/etc'"
	"ShellSyntax new appendPath: 'etc' toPath: '/'"
	"ShellSyntax new appendPath: 'hosts' toPath: '/etc'"
	"ShellSyntax new appendPath: 'WINDOWS' toPath: 'C:\'"
	"ShellSyntax new appendPath: 'someFileName' toPath: 'C:\WINDOWS'"

	| newPath |
	^ (aPathString findTokens: CommandShell pathSeparator)
		inject: startingPathString
		into: [:dirPath :nextPart | 
			nextPart = '..'
				ifTrue: [newPath := self upOneDirectoryLevel: dirPath]
				ifFalse: [nextPart = '.'
						ifTrue: [newPath := dirPath]
						ifFalse: [newPath := (self isAtFileSystemRoot: dirPath)
										ifTrue: [dirPath , nextPart]
										ifFalse: [dirPath , CommandShell pathSeparator , nextPart]]].
			newPath]