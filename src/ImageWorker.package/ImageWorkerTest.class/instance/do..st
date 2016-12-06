helper
do: aBlock
	| imageWorker |
	imageWorker := ImageWorker new.
	imageWorker block: aBlock.
	
	^ [[ imageWorker value ]
		ensure: [ imageWorker cleanUp ]] 
			valueWithin: 10 seconds 
			onTimeout: [ 
				imageWorker cleanUp.
				Error signal: 'Timeout: Image worker took longer than 10 seconds to complete' ]