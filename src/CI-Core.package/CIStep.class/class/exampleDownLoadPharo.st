as yet unclassified
exampleDownLoadPharo

	^ (CIStep named: 'Download Pharo')
		addOperation: (CIShellCommand doing: 'wget -O download.sh http://get.pharo.org/60+vm');
		addOperation: (CIShellCommand doing: 'bash download.sh');
		output: { 'pharo'. 'pharo-ui'. 'pharo-vm'. 'Pharo.image'. 'Pharo.changes' };
		yourself