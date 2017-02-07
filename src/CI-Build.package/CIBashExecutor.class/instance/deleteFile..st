executing
deleteFile: aPath

	self executeBash: ('rm {1}' format: { aPath })