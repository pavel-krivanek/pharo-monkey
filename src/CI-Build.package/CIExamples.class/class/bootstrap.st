examples
bootstrap

	^ (CITask named: 'bootstrap')
		addSubtask: self bootstrapProcessImage;
		addSubtask: ((CITask named: 'bootstrapImage')
			import: { 'bootstrapProcessImage' };
			addStep: ((CIPharoStep st: 'bootstrap/scripts/bootstrap.st')
				addOption: '--ARCH=32');
			command: 'mv bootstrap-cache/bootstrap.image bootstrap-cache/Pharo.image';
			output: { 'bootstrap-cache/*' });
		addSubtask: ((CITask named: 'vm')
			dump: 'bootstrap/scripts/download_vm.sh';
			command: 'BOOTSTRAP_ARCH=32 bash download_vm.sh';
			output: { 'vm/*' });
		yourself