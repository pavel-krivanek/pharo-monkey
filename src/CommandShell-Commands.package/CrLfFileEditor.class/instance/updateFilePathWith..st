private
updateFilePathWith: aPathString

	self fileName: (CommandShell localNameFor: aPathString).
	self directory: (CommandShell directoryForPath: aPathString).
	self changed: #relabel
