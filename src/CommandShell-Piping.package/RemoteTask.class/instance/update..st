updating
update: anObject
	"An event handler has indicated availability of data on the pipe from
	the remote process. Begin reading data until the entire result object
	is received. The remote process will exit when complete, but possibly
	not until data has been read from the pipe, as it may block on write
	until the pipe has been serviced."

	(anObject isKindOf: AioEventHandler)
		ifTrue: [[completionBlock
						ifNotNil: [completionBlock value: self result]]
					ensure: [anObject close]]