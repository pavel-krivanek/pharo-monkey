CIProcess new
	addStep: ((CIStep named: 'download')
		addOperation: (CIShellCommand doing: 'wget -O download.sh http://get.pharo.org/60+vm');
		addOperation: (CIShellCommand doing: 'bash download.sh');
		output: { 'pharo'. 'pharo-ui'. 'pharo-vm'. 'Pharo.image'. 'Pharo.changes' };
		yourself);
	addStep: ((CIStep named: 'tests-A-L')
    import: { 'download' };
		addOperation: ((CICallPharo test: '[A-L].*')
			addOption: '--junit-xml-output');
		output: { '*.xml' };
		yourself);
	addStep: ((CIStep named: 'tests-M-Z')
    import: { 'download' };
		addOperation: ((CICallPharo test: '^(?!(Metacello|Release))[M-Z].*')
			addOption: '--junit-xml-output');
		output: { '*.xml' };
		yourself);
	addStep: ((CIStep named: 'tests-Release')
    import: { 'download' };
		addOperation: ((CICallPharo test: 'ReleaseTests')
			addOption: '--junit-xml-output');
		output: { '*.xml' };
		yourself)
