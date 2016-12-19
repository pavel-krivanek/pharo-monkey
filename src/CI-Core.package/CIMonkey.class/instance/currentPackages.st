export
currentPackages

	"return a dictionary of package names and names of their latest versions (or nil if the package was not saved before)"
	
	^ MCWorkingCopy allManagers collect: [ :each | 
		| latest |
		latest := each ancestry ancestors 
			ifNotEmpty: [ each ancestry ancestors first ]
			ifEmpty: [ nil ].
		each packageName -> latest ].
