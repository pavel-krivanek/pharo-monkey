implementations
helpCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray

	| topic command cacheStream |
	argArray size == 0
		ifTrue:
			[cacheStream := WriteStream on: String new.
			(commandShell builtinCommands
				collect: [:c | c helpSelector] thenSelect: [:s | s notNil])
					asArray sort do:
						[:sel | cacheStream nextPutAll: (self perform: sel);
								nextPut: Character lf].
			cacheStream
				nextPutAll: 'simple Smalltalk expression! evaluates a simple expression as a doIt';
				nextPut: Character lf;
				nextPutAll: '<ctl-C> to interrupt a running program';
				nextPut: Character lf;
				nextPutAll: '<ctl-D> to end input to a running program';
				nextPut: Character lf.
			stdout nextPutAll: cacheStream contents]
		ifFalse:
			[topic := argArray at: 1.
			command := commandShell builtinCommands at: topic ifAbsent: [^ self].
			command helpSelector ifNotNil:
				[stdout nextPutAll: (self perform: command helpSelector); nextPut: Character lf]]
