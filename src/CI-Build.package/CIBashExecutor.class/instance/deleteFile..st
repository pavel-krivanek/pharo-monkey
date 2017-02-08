executing
deleteFile: aPath

	self executeBash: ('rm -rf {1}' format: { aPath })