visiting
visitDumpStep: aCIDumpStep 
	
	aCIDumpStep files do: [ :each |
		self
			copy: ((OSPlatform current environment getEnv: 'PWD') asFileReference / each)
			to: currentStep buildDirectory
			recursive: true
	]