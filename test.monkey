CIProcess new
	addStep: ((CIStep named: 'download')
		addOperation: (CIShellCommand doing: 'wget -O download.sh http://get.pharo.org/60+vm');
		addOperation: (CIShellCommand doing: 'bash download.sh');
		output: { 'pharo'. 'pharo-ui'. 'pharo-vm'. 'Pharo.image'. 'Pharo.changes' };
		yourself);
	addStep: ((CIStep named: 'eval')
		addOperation: (CICallPharo eval: '2+2');
		yourself);
	yourself
