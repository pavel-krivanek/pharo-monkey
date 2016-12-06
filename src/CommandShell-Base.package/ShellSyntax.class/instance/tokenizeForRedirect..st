command string parsing
tokenizeForRedirect: aString
	"Answer a collection of tokens for IO redirection. Answers a collection of
	tokens, where each token is either a String, or a Symbol in:
	#(#inputRedirect #outputRedirect #outputAppendRedirect #errorRedirect #errorAppendRedirect)"

	"ShellSyntax new tokenizeForRedirect: 'one > two < three 2> four five six 2>> seven eight > nine ten >> eleven twelve 2 > thirteen'"

	| oc rs ws c redirectToken tok |
	oc := OrderedCollection new.
	rs := ReadStream on: aString.
	ws := WriteStream on: String new.
	[rs atEnd]
		whileFalse:
			[c := rs next.
			((c == $2) and: [rs peek == $>])
				ifTrue:
					[rs next.
					(rs peek == $>)
						ifTrue:
							[rs next.
							redirectToken := #errorAppendRedirect]
						ifFalse:
							[redirectToken := #errorRedirect].
					c := ws contents.
					(c size > 0)
						ifTrue:
							[oc add: c.
							ws resetContents].
					oc add: redirectToken]
				ifFalse:
					[(c == $>)
						ifTrue:
							[(rs peek == $>)
								ifTrue:
									[rs next.
									redirectToken := #outputAppendRedirect]
								ifFalse:
									[redirectToken := #outputRedirect].
							c := ws contents.
							(c size > 0)
								ifTrue:
									[oc add: c.
									ws resetContents].
							oc add: redirectToken]
						ifFalse:
							[(c == $<)
								ifTrue:
									[c := ws contents.
									(c size > 0)
										ifTrue:
											[oc add: c.
											ws resetContents].
									oc add: #inputRedirect]
								ifFalse: [ws nextPut: c]]]].
	tok := ws contents.
	(tok size > 0) ifTrue: [oc add: tok].
	^ oc
