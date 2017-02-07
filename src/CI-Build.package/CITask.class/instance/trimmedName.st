accessing
trimmedName
	
	"Remove all spaces from name. This is the name used to create directories"
	^ name copyReplaceAll: ' ' with: ''