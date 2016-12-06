command string parsing
redirectIOFor: commandString inDirectoryPath: dirPathString
	"Handle IO redirection. Answer a four element array with the command string
	(with IO tokens removed); and stdin, stdout and stderr if specified for
	redirection."

	"ShellSyntax new
		redirectIOFor: 'ls /tmp /NOSUCHFILE > /tmp/sqTempOut.tmp 2> /tmp/sqTempErr.tmp'
		inDirectoryPath: nil"
	"ShellSyntax new
		redirectIOFor: 'cat < /etc/hosts > /tmp/sqHosts.tmp'
		inDirectoryPath: nil"

	| cmd tokenStream tok target input output error |
	cmd := nil.
	input := output := error := nil.
	"Default to nil unless overridden by commandString."
	tokenStream := ReadStream on: (self tokenizeForRedirect: commandString).
	[tokenStream atEnd]
		whileFalse:
			[tok := tokenStream next.
			tok == #inputRedirect
				ifTrue: ["Do input redirection"
					target := self firstExpandedArgument: tokenStream next
								inDirectoryPath: dirPathString.
					"Use StandardFileStream to prevent multi-byte interpretation."
					input := StandardFileStream readOnlyFileNamed: target.
					input
						ifNil: [self inform: 'Cannot open ' , target , ', using default stdin']]
				ifFalse: [tok == #outputRedirect
						ifTrue: ["Do output redirection"
							target := self firstExpandedArgument: tokenStream next
										inDirectoryPath: dirPathString.
							output := self truncatedOutputFile: target.
							output ifNil:
									[self inform: 'Cannot open ' , target , ', using default stdout']]
						ifFalse: [tok == #outputAppendRedirect
								ifTrue: ["Do output redirection, appended to existing output file if any."
									target := self firstExpandedArgument: tokenStream next
												inDirectoryPath: dirPathString.
									output := FileStream fileNamed: target.
									output isNil
										ifTrue: [self inform: 'Cannot open ' , target , ', using default stdout']
										ifFalse: [output setToEnd]]
								ifFalse: [tok == #errorRedirect
										ifTrue: ["Do error redirection"
											target := self firstExpandedArgument: tokenStream next
														inDirectoryPath: dirPathString.
											error := self truncatedOutputFile: target.
											error ifNil:
													[self inform: 'Cannot open ' , target , ', using default stdout']]
										ifFalse: [tok == #errorAppendRedirect
												ifTrue: ["Do error redirection, appended to existing error file if any. "
													target := self firstExpandedArgument: tokenStream next
																inDirectoryPath: dirPathString.
													error := FileStream fileNamed: target.
													error isNil
														ifTrue: [self inform: 'Cannot open ' , target , ', using default stdout']
														ifFalse: [error setToEnd]]
												ifFalse: [cmd isNil
														ifTrue: [cmd := tok]
														ifFalse: [self inform: 'Ack! Pfft! IO redirection parsing error.']]]]]]].
	^ Array
		with: cmd
		with: input
		with: output
		with: error