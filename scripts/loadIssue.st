
before := MCWorkingCopy allManagers collect: [ :each | each packageName -> each ancestry ancestors first ].

manager := CIChangeManager pharo.
manager publisher: CICommandLinePublisher.

manager 
		logOnWithEmail: (Smalltalk os environment at: 'PHARO_CI_USER' ifAbsent: nil)
		password: (Smalltalk os environment at: 'PHARO_CI_PWD' ifAbsent: nil).
		
self assert: (manager isAuthenticated).
	
issue := manager nextIssueToBeChecked.

self assert: (manager isAuthenticated).

issue load.

after := MCWorkingCopy allManagers collect: [ :each | each packageName -> each ancestry ancestors first ].



beforeDict := before asDictionary.
afterDict := after asDictionary.

"add deleted packages"
toDelete := (beforeDict keys copyWithoutAll: afterDict keys) asSet.

toExport := after select: [:assoc | (beforeDict at: assoc key ifAbsent: [nil]) ~= assoc value ] thenCollect: #key.

toExport := toExport reject: [ :packageName | packageName beginsWith: 'SLICE' ].

toDelete, toExport do: [ :packageName |
	('./pharo-core/src' asFileReference / (packageName, '.package')) ensureDeleteAll. ].

toExport do: [ :packageName |
newVersion := MCVersion 
		package: (MCPackage named: packageName)
		info: packageName asPackage mcWorkingCopy versionInfo 
		snapshot: packageName asPackage mcWorkingCopy snapshot.

MCFileTreeGitWriter
				fileOut: newVersion
				on: (MCFileTreeRepository new directory: './pharo-core/src' asFileReference ensureCreateDirectory).
	
	].
	
	


