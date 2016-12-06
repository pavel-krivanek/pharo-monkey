initialize - release
close
	"Close pipe to proxy input. The pipes from output and error are not
	closed. This will result in the external process seeing end of file on its
	input stream, which typically causes the external process to flush any
	remaining data to its output and error streams, then exit. It is the
	responsibility of the user to wait for that data to become available,
	read any data of interest, then close the output and error pipes to
	free remaining external pipe references (see closePipes)."

	^super close
