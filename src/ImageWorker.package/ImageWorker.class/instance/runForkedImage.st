private
runForkedImage
	self flag: #fixMe. "'burning' one delay to ensure the wait for timeout works... 
	this is because there is a recurring timeout bug and it might be related to a delay failing bug 
	we believe is fixed (first delay was timing out immediatly)..."
	1 milliSecond wait. 
	[[ self waitForForkedImage ]
		valueWithin: self timeout onTimeout: timeoutBlock.
		^ self readForkedImageResult
	] ensure: [ self cleanUp ]