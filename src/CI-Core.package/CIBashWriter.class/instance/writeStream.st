writing
writeStream
	
	^ writeStream ifNil: [ writeStream := (currentStep baseDirectory / 'build.sh') writeStream ]