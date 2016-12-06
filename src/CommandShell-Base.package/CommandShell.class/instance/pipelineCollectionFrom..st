command line parsing
pipelineCollectionFrom: aCommandString
	"Break aCommandString into individual pipeline command strings, and answer a
	collection of process proxy pipelines."

	"CommandShell new pipelineCollectionFrom: 'who | cat | wc; ps -aef | cat& pwd | cat'"

	| str pipelineCollection tokens strm cmd cmdWithTerm pipeline lastProxy |
	str := CommandShell withBlanksTrimmed: aCommandString.
	pipelineCollection := OrderedCollection new.
	(self shellSyntax isComment: str)
		ifFalse:
			[tokens := str findTokens: ';&' keep: ';&'.
			strm := ReadStream on: tokens.
			[strm atEnd]
				whileFalse:
					[cmd := CommandShell withBlanksTrimmed: strm next.
					(self shellSyntax isComment: cmd)
						ifFalse:
							[strm atEnd
								ifTrue:
									[((cmd size == 1) and: [((cmd at: 1) == $;) | ((cmd at: 1) == $&)])
										ifTrue:
											["Special case, user has entered ';<cr>' or '&<cr>'"
											cmd := cmdWithTerm := '']
										ifFalse:
											[cmdWithTerm := cmd]]
								ifFalse:
									[cmdWithTerm := cmd, strm peek].
							self saveInHistoryList: cmdWithTerm.
							(cmdWithTerm size > 0)
								ifTrue:
									[pipeline := ProxyPipeline fromString: cmd shell: self.
									pipeline background:
										(strm next = self shellSyntax noWaitToken).
									lastProxy := pipeline last.
									lastProxy ifNil:
										[self inform: 'cannot access system'.
										^ nil].
									lastProxy outputPipeForNextProxy
										ifNotNil:
											[lastProxy setNonBlockingOutput].
									pipelineCollection add: pipeline]]]].
	^ pipelineCollection
