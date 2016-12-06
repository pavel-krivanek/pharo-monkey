globbing
nextGlobToken: aStream lastToken: aToken tokenStream: aTokenStream
	"Escape character processing probably belongs elsewhere. Since it can conflict
	with Win32 file name conventions, I have commented it out here. The code
	is otherwise left alone here in case I change my mind later. -dtl"

	| c |
	(aToken == #escape)
		ifTrue:
			[^ aStream next]
		ifFalse:
			[c := aStream next.
			(c == $[)
				ifTrue:
					["character range"
					^ self globRangeFrom: (aStream upTo: $]) tokenStream: aTokenStream]
				ifFalse:
					[(c == $*) ifTrue: [^ #matchRun].
					(c == $?) ifTrue: [^ #matchAny].
					"(c == $\) ifTrue: [^ #escape].	Escape processing disabled here"
					^ c asString]]