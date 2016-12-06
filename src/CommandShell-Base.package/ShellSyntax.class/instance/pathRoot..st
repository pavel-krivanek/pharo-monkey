platform dependent
pathRoot: aPathString
	"For aPathString pointing to a file in a file system, answer the root of the
	file system. This method works fine for Unix and Windows, but may require
	conditional code for other platforms."

	| prefix |
	prefix := (self splitLocationPrefixFromPath: aPathString) first.
	^ prefix, CommandShell pathSeparator
