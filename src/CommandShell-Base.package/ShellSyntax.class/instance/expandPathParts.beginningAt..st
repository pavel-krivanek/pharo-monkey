path name expansion
expandPathParts: pathParts beginningAt: root
	"Walk directory tree and answer a collection of matching path strings."

	| firstPart remainder dirPaths names dirNames basePath |
	(pathParts size == 0)
		ifTrue:
			["Should never get here, but just in case"
			^ Array with: root].
	firstPart := pathParts first.
	remainder := pathParts allButFirst.
	(firstPart = '.')
		ifTrue: "Stay at the current directory level"
			[dirPaths := Array with: root]
		ifFalse:
			[(firstPart = '..') "Move up a directory level if possible"
				ifTrue:
					[dirPaths := Array with: (self upOneDirectoryLevel: root)]
				ifFalse: "Normal case, a directory name"
					[remainder isEmpty
						ifTrue:
							["This condition terminates recursion"
							names := self glob: firstPart inDirectory: root.
							^ (root = CommandShell pathSeparator)
								ifTrue: [^ names collect: [:n | root, n]]
								ifFalse: [^ names collect: [:n | root, CommandShell pathSeparator, n]]]
						ifFalse:
							["Continue recursion until no more elements"
							CommandShell directoryNamesInPath: root.
							dirNames := self glob: firstPart
											names: (CommandShell directoryNamesInPath: root).
							(('*', CommandShell pathSeparator) match: root)
								ifTrue: [basePath := root]
								ifFalse: [basePath := root, CommandShell pathSeparator].
							dirPaths := dirNames collect: [:d | basePath, d]]]].
		^ dirPaths
			inject: OrderedCollection new
			into: [:result :dir |
				result addAll: (self expandPathParts: remainder beginningAt: dir).
				result]
