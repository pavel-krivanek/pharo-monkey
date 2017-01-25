high-level
ensureCreateDirectory: aDirectory

	self writeLine: 'mkdir -p {1}' format: { aDirectory fullName }.