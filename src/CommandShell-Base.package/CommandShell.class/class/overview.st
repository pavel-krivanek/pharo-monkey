documentation
overview
	"A general overview"

	"CommandShell new pipeline: 'CommandShell overview! | edit'"

	| rs ws |
	rs := ReadStream on: self htmlOverview.
	ws := WriteStream on: String new.
	[rs atEnd]
		whileFalse:
			[ws nextPutAll: (rs upTo: $<).
			rs upTo: $>].
	^ ws contents
