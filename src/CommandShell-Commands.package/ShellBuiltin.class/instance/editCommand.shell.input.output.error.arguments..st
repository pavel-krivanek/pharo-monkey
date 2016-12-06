implementations
editCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Open an editor on each of the named files."

	| controllers inputString expandedName |
	(argArray isNil or: [argArray size == 0])
		ifTrue:
			["When taking input from a command pipeline, the input must be
			read into inputString now. This is because, in MVC, the CrLfFileEditor
			is scheduled to be created later, and the input pipe will be closed by
			the caller of this method before the CrLfFileEditor ever has a chance
			to read it."
			| workingDir |
			inputString := stdin isNil
				ifTrue:
					['']
				ifFalse:
					[(self copyUntilDoneFrom: stdin to: (WriteStream on: String new)) contents
						replaceAll: Character lf with: Character cr].
			workingDir := CommandShell useFileSystem
					ifTrue: [commandShell workingDirectory perform: #asFileReference]
					ifFalse: [(Smalltalk at: #FileDirectory) on: commandShell workingDirectory].
			commandShell scheduleToEvaluate:
				[CrLfFileEditor
					openOn: inputString
					withLabel: (commandShell commandHistory isEmpty
									ifTrue: ['']
									ifFalse: [commandShell commandHistory last])
					inDirectory: workingDir
					defaultFileName: 'buffer.txt']]
		ifFalse:
			[controllers := argArray collect:
				[:arg |
				"Expand arguments to convert them to full pathnames as expected by CrLfFileEditor"
				expandedName := commandShell shellSyntax
									firstExpandedArgument: arg
									inDirectoryPath: commandShell shellSyntax workingDirectory.
				CrLfFileEditor fileNamed: expandedName withLabel: arg].
			CommandShell isMorphic
				ifFalse:
					[controllers
						inject: nil
						into:
							[:prev :c |
							prev ifNotNil:
								[c addDeferredUIMessage: [prev open]].
							c].
					commandShell scheduleToEvaluate: [controllers last open]]
				ifTrue:
					[controllers do: [:e |
						WorldState addDeferredUIMessage: [e openInWorld]]]]
