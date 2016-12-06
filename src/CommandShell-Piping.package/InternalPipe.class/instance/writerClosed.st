accessing
writerClosed

	^ writerClosed ifNil: [writerClosed := false]
