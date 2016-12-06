platform dependent
upOneDirectoryLevel: aPathName
	"Answer a path name for a directory one level up the directory tree"

	 "ShellSyntax new upOneDirectoryLevel: 'C:\Windows\temp'"
	 "ShellSyntax new upOneDirectoryLevel: 'C:\Windows'"
	 "ShellSyntax new upOneDirectoryLevel: 'C:\'"
	 "ShellSyntax new upOneDirectoryLevel: ''"
	 "ShellSyntax new upOneDirectoryLevel: '/usr/bin'"
	 "ShellSyntax new upOneDirectoryLevel: '/usr'"
	 "ShellSyntax new upOneDirectoryLevel: '/'"
	 "ShellSyntax new upOneDirectoryLevel: 'usr'"
	 "ShellSyntax new upOneDirectoryLevel: ''"

	| prefixAndPath prefix path newPath |
	prefixAndPath := self splitLocationPrefixFromPath: aPathName.
	prefix := prefixAndPath at: 1.
	path := prefixAndPath at: 2.
	(self isAtFileSystemRoot: aPathName)
		ifTrue:
			[(self isAbsolutePath: aPathName)
				ifTrue:
					[prefix isEmpty
						ifTrue: "Normal case, unix. Do not go up a level."
							[^ aPathName]
						ifFalse: "A Win32 device name, go up a level above the file systems"
							[^ '']]
				ifFalse:
					["One level above whererever we are. Unfortunately we have
					no way to know where we are, so this probably should be treated
					as a sytax error."
					^ '..']]
		ifFalse:
			[newPath := (path includes: CommandShell pathNameDelimiter)
				ifTrue: [path copyUpToLast: CommandShell pathNameDelimiter]
				ifFalse: [''].
			^ newPath isEmpty
				ifTrue:
					[(self isAbsolutePath: aPathName)
						ifTrue: [prefix, CommandShell pathSeparator]
						ifFalse: [prefix]]
				ifFalse:
					[prefix, newPath]]
