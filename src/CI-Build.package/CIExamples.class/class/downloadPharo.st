examples
downloadPharo

	^ (CITask named: 'pharo6')
		addStep: (CIShellStep command: 'wget -O download.sh http://get.pharo.org/60+vm');
		addStep: (CIShellStep command: 'bash download.sh');
		output: { 'pharo'. 'pharo-ui'. 'pharo-vm'. 'Pharo.image'. 'Pharo.changes' };
		yourself