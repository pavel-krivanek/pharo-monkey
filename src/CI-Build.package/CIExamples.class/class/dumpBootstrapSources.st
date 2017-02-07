examples
dumpBootstrapSources

	^ (CITask named: 'sources')
		addStep: (CIDumpStep files: { 'bootstrap' . 'src' });
		yourself