examples
bootstrapProcessImage

	^ (CITask named: 'bootstrapProcessImage')
		addSubtask: self downloadPharo;
		addSubtask: self dumpBootstrapSources;
		addStep: (CIPharoStep st: 'bootstrap/scripts/prepare_image.st');
		yourself