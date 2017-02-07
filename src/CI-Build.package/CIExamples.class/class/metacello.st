examples
metacello

	^ (CITask named: 'metacello')
		addSubtask: self monticelloFull;
		dump: 'bootstrap/scripts/03-metacello-bootstrap/*';
		pharoScriptFile: '01-loadMetacello.st'
		yourself