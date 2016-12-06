private
forceDirtyBuffer
	"This will force the view to behave as if it had been edited. Call this to
	enable a file save even if the text has not actually been edited by the
	user."

	| controller |
	controller := self dependents
			detect: [:e | e respondsTo: #hasUnacceptedEdits:]
			ifNone:
				[self dependents
					collect: [:d | d controller]
					thenSelect: [:c | c respondsTo: #hasUnacceptedEdits:]].
	controller hasUnacceptedEdits: true.
