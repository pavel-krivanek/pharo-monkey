accessing
queue

	^ queue ifNil: [queue := SharedQueue new]
