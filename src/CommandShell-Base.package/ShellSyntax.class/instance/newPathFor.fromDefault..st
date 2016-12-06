path name expansion
newPathFor: aPathString fromDefault: startingPathString
	"Answer a new path starting from startingPathString if aPathString is a,
	relative path, otherwise just answer aPathString unmodified."

	"ShellSyntax new newPathFor: 'hosts' fromDefault: '/etc'"
	"ShellSyntax new newPathFor: 'three' fromDefault: 'one/two'"
	"ShellSyntax new newPathFor: 'one/two/three' fromDefault: ''"
	"ShellSyntax new newPathFor: '/hosts' fromDefault: '/etc'"
	"ShellSyntax new newPathFor: 'WINDOWS' fromDefault: 'C:\'"
	"ShellSyntax new newPathFor: 'D:\WINDOWS' fromDefault: 'C:\'"
	"ShellSyntax new newPathFor: 'D:WINDOWS' fromDefault: 'C:\'"

	^ (self isAbsolutePath: aPathString)
		ifTrue:
			[aPathString]
		ifFalse:
			[self appendPath: (self splitLocationPrefixFromPath: aPathString) last
					toPath: startingPathString]
