initialize - release
prepareOutputFor: aPipeJunction
	"External process proxies are independent of the Smalltalk image and do
	not require event driven input. Internal proxies will prefer to request
	event notification."

	aPipeJunction isExternalProcess
		ifTrue: [self prepareOutputForPipe]
		ifFalse: [self prepareOutputForInternalReader]
