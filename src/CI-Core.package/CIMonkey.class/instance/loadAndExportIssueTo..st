export
loadAndExportIssueTo: aDirectoryReference
	
	| before after beforeDict afterDict toDelete toExport |
	
	self publisher progressMessage: 'Loading issue...'.
		
	before := self currentPackages.
	self publisher progressMessage: 'Loading issue...'.
	issue load.
	self publisher progressMessage: 'Issue loaded'.
	after := self currentPackages.

	beforeDict := before asDictionary.
	afterDict := after asDictionary.

	"add deleted packages"
	toDelete := (beforeDict keys copyWithoutAll: afterDict keys) asSet.
	toExport := after select: [:assoc | (beforeDict at: assoc key ifAbsent: [nil]) ~= assoc value ] thenCollect: #key.

	toExport := toExport reject: [ :packageName | packageName beginsWith: 'SLICE-Issue-' ].

	toDelete, toExport do: [ :packageName |
		(aDirectoryReference asFileReference / (packageName, '.package')) ensureDeleteAll. ].

	toExport do: [ :packageName |
		| newVersion |
		self publisher progressMessage: 'Exporting package ', packageName.

		newVersion := MCVersion 
			package: (MCPackage named: packageName)
			info: packageName asPackage mcWorkingCopy versionInfo 
			snapshot: packageName asPackage mcWorkingCopy snapshot.

		MCFileTreeGitWriter
			fileOut: newVersion
			on: (MCFileTreeRepository new directory: aDirectoryReference asFileReference ensureCreateDirectory).
		].	

	self publisher progressMessage: 'Exporting finished'.


		
