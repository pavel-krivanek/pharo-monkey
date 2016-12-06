platform dependent
isAtFileSystemRoot: aPathString
	"Answer true if aPathString is not a subdirectory."

	"ShellSyntax new isAtFileSystemRoot: 'D:\'"
	"ShellSyntax new isAtFileSystemRoot: 'D:'"
	"ShellSyntax new isAtFileSystemRoot: 'D:\Windows'"
	"ShellSyntax new isAtFileSystemRoot: '\'"

	^ (CommandShell pathSeparator = (self splitLocationPrefixFromPath: aPathString) last) or: [aPathString isEmpty]
