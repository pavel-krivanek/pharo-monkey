checking test results
checkTestResults

	| directoryPath |

	directoryPath := self
		optionAt: 'directory'
		ifAbsent: [ ^ self error: 'Missing option --directory' ].

	^ self monkey checkTestResultsFrom: directoryPath asFileReference.

	