examples
monticelloFull

	^ (CITask named: 'monticello-full')
		addSubtask: self monticelloBootstrap;
		pharoScriptFile: '03-bootstrapMonticelloRemote.st';
		yourself