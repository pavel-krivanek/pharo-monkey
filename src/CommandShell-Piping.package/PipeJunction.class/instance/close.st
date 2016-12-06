initialize - release
close
	"Close pipe to proxy input."

	pipeToInput ifNotNil: [pipeToInput close]
