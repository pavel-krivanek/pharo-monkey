examples
core

	^ (CITask named: 'core')
			addSubtask: self bootstrap;
			dump: 'bootstrap/scripts/01-initialization/01-init.st';
			dump: 'bootstrap/scripts/01-initialization/02-initRPackageOrganizer.st';
			pharoScriptFile: '01-init.st';
			pharoScriptFile: '02-initRPackageOrganizer.st';
			yourself