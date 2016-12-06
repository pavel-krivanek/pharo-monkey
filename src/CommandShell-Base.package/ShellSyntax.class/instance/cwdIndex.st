accessing
cwdIndex
	"Key to current cwd path name in cwdDictionary"

	^ cwdIndex ifNil: [cwdIndex := self cwdIndexFor: CommandShell defaultPathString]
