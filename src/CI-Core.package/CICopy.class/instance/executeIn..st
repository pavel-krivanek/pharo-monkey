execution
executeIn: aCIStep 
	
	filesToCopy do: [ :each | 
		(aCIStep buildDirectory / each) copyTo: (destination / each)  ]