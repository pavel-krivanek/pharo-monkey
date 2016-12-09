export
exportIssue
	
	| directoryPath before after beforeDict afterDict toDelete toExport validationResult |
	
	validationResult := CIValidationResult change: issue.
	
	[ 

	directoryPath := self
		optionAt: 'directory'
		ifAbsent: [ ^ self error: 'Missing option --directory' ].
	
	before := self currentPackages.

	issue load.

	after := self currentPackages.

	beforeDict := before asDictionary.
	afterDict := after asDictionary.

	"add deleted packages"
	toDelete := (beforeDict keys copyWithoutAll: afterDict keys) asSet.

	toExport := after select: [:assoc | (beforeDict at: assoc key ifAbsent: [nil]) ~= assoc value ] thenCollect: #key.

	toExport := toExport reject: [ :packageName | packageName beginsWith: 'SLICE-Issue-' ].

	toDelete, toExport do: [ :packageName |
		(directoryPath asFileReference / (packageName, '.package')) ensureDeleteAll. ].

	toExport do: [ :packageName |
		| newVersion |
		newVersion := MCVersion 
			package: (MCPackage named: packageName)
			info: packageName asPackage mcWorkingCopy versionInfo 
			snapshot: packageName asPackage mcWorkingCopy snapshot.

		MCFileTreeGitWriter
			fileOut: newVersion
			on: (MCFileTreeRepository new directory: directoryPath asFileReference ensureCreateDirectory).
		].	
	
	self reportIssue: issue.
	
	] on: MCMergeResolutionRequest, Error, Warning, Halt do: [ :anError |
		validationResult addError: anError ].
	
	manager publisher publishValidationResult: validationResult.
			
	self exitSuccess.
