private - forked image
serializeResult: result isError: isError
	[
		self serialize: { result. isError }.
	] on: Error do: [ :error |
		| stackString |
		stackString := String streamContents: [ :s| error signalerContext shortDebugStackOn: s ].
		self inform: 'Could not serialize result: ', stackString.
		[ 
			self serialize: { error freezeUpTo: thisContext. true }.
		] on: Error do: [ :anotherError| Exit signalFailure ]]