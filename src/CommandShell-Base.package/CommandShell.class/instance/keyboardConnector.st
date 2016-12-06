accessing
keyboardConnector
	"If nil, then my views should behave normally. If a WriteStream, then my
	views should attempt to forward all keyboard inputs to the WriteStream.
	This is to permit the keyboard to be connected to an externally executing
	process, then reconnected to its normal functions when the external process
	is complete."


	^ keyboardConnector