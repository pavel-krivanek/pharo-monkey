as yet unclassified
exampleDownLoadPharo

	^ (CITask named: 'Download Pharo')
		addOperation: (CIShellStep doing: 'wget -O download.sh http://get.pharo.org/60+vm');
		addOperation: (CIShellStep doing: 'bash download.sh');
		output: { 'pharo'. 'pharo-ui'. 'pharo-vm'. 'Pharo.image'. 'Pharo.changes' };
		yourself