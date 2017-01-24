exporting
newWriter

	| writer |
	writer := CIBashWriter new.
	"writer addEnvironmentVariable: CIWorkingDirectoryEnvironmentVariable new."
	writer addEnvironmentVariable: CICurrentScriptDirectory new.
	writer addEnvironmentVariable: CIMonkeyDirectory new.
	^ writer