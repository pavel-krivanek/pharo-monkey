private
handleForkedImageResultWithExitStatus: anInteger 
	"This method handles the case where the external image failed.
	There are 2 possibilities:
	1. the external image exited/crashed and no result was produced
	2. the external image had problems serializing the result but still produced a result file with the serialization error"
	
	
	self resultFile exists
		ifFalse: [ Error signal: 'External Image Failed: ', anInteger asString ].
		
	^ self readForkedImageResult