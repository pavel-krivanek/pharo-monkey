input character filtering
checkSttyFor: characterValue
	"Check for interrupt characters and such. Consume interrupt character and
	answer nil, otherwise answer characterValue."

	(self isInterrupt: characterValue)
		ifTrue:
			[self changed: #interruptCharacter.
			^ nil].
	(self isEndOfFile: characterValue)
		ifTrue:
			[self doEndOfFile.
			^ nil].
	^ characterValue