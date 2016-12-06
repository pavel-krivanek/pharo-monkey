path name expansion
newDirPath: aPath from: initialPath
	"Answer a path string for a change directory command. Change from initialPath
	(usually the current working directory) to the new path, where aPath may be
	either an absolute path name (fully specified from the root) or a relative path
	name (relative to initialPath)."

	"self new newDirPath: 'b?n' from: '/usr'"
	"self new newDirPath: '..' from: '/usr/bin'"
	"self new newDirPath: '.././bin' from: '/usr/bin'"
	"self new newDirPath: '../../../../..' from: '/usr/bin'"
	"self new newDirPath: '../../../../../usr' from: '/usr/bin'"

	^ (self expandedPathsFrom: aPath beginningAt: initialPath)
		at: 1
		ifAbsent: [nil]

