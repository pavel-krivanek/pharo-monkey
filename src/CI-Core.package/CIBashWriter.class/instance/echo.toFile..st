high-level
echo: aText toFile: aFile

	self writeCommand: 'echo {1} > {2}' format: { aText. aFile fullName}