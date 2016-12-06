initialize - release
close
	"Close input pipe to first proxy in the pipeline. The proxies are not
	finalized, this simply closes the input stream to allow normal processing
	to proceed to completion."

	self isEmpty ifFalse: [self first close]
