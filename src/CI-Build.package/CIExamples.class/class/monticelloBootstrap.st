examples
monticelloBootstrap

	^ (CITask named: 'monticello-bootstrap')
		addSubtask: self core;
		dump: 'bootstrap/scripts/02-monticello-bootstrap/*';
		pharoScriptFile: 'st-cache/Monticello.st';
		pharoScriptFile: '01-fixLocalMonticello.st';
		pharoScriptFile: '02-bootstrapMonticello.st';
		yourself