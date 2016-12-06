baseline
baseline: spec 
    
	<baseline>
        
	| repository | 
	
	repository := 'filetree://./pharo-monkey/src'.    
	spec for: #common do: [
		spec preLoadDoIt: #'preload:package:'.
		spec postLoadDoIt: #'postload:package:'.

		spec package: 'Collections-OrderPreservingDictionary'.
		spec package: 'Collections-BitmapCharacterSet'.

		spec package: 'XML-Parser'.
		spec package: 'XML-Tests-Parser'.
		spec package: 'XML-Writer-Core'.
		spec package: 'XML-Writer-Tests'.

		spec package: 'Soup-Core'.
		spec package: 'Soup-XPath'.
		spec package: 'Soup-Tests-Core'.
		spec package: 'Soup-Help'.

		spec package: 'OSProcess-Base'.
		spec package: 'OSProcess-Unix'.
		spec package: 'OSProcess-Mac'.
		spec package: 'OSProcess-Win32'.
		spec package: 'OSProcess-AIO'.
		spec package: 'OSProcess-OS2'.
		spec package: 'OSProcess-RiscOS'.
		
		spec package: 'CommandShell-Base'.
		spec package: 'CommandShell-Commands'.
		spec package: 'CommandShell-Piping'.
		spec package: 'CommandShell-Tests'.
		spec package: 'CommandShell-UI'.
		spec package: 'CommandShellPharo'.
		spec package: 'CommandShell-Morphic'.

		spec package: 'FuelMetalevel'.

		spec package: 'CI-Core'.
		spec package: 'CI-FogBugzAPI'.
		spec package: 'CI-Loader'.
		spec package: 'CI-Integration'.
	].