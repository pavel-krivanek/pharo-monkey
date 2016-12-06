finalization
finalize
	"If garbage collected before remote processing is complete, the AIO
	handler process should be terminated and the external process should
	be stopped. When evaluating a #do:whenComplete: a reference should
	be maintained to the RemoteTask in order to avoid this finalization."

	aioHandler ifNotNilDo: [:aio | aio close].
	childProxy ifNotNilDo: [:child | child terminate]