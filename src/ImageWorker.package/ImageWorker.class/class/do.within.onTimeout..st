api
do: aBlock within: aTimeoutDuration onTimeout: anZeroArgumentsBlock
	^ self new 
		block: aBlock;
		timeout: aTimeoutDuration;
		timeoutBlock: anZeroArgumentsBlock;
		value