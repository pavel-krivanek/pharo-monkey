working directory
setCwdIndexFrom: aPathString
	"Set the current working directory index to a string (Win32 device name) or to #default."

	| prefix |
	prefix := (self splitLocationPrefixFromPath: aPathString) first.
	prefix isEmpty
		ifTrue: [self cwdIndex: #default]
		ifFalse: [self cwdIndex: prefix]
