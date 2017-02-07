accessing
taskDirectory
	
	^ taskDirectory ifNil: [ 
		self parent
			ifNil: [ CIUtils pwd / 'build' ]
			ifNotNil: [ self parent tasksDirectory / self trimmedName ] ]