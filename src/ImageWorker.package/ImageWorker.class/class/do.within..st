api
do: aBlock within: aTimeoutDuration
	^ self new 
		block: aBlock;
		timeout: aTimeoutDuration;
		value