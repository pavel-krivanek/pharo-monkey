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

		spec package: 'ImageWorker'.

		spec package: 'CI-Core'.
		spec package: 'CI-FogBugzAPI'.
		spec package: 'CI-Validation'.
		spec package: 'CI-Core-Tests'.
		spec package: 'CI-ForkedValidation'.
		spec package: 'CI-Loader'.
		spec package: 'CI-Integration'.
		
		spec group: 'Collections' with: #('Collections-OrderPreservingDictionary' 'Collections-BitmapCharacterSet').
		spec group: 'XML' with: #('XML-Parser' 'XML-Tests-Parser' 'XML-Writer-Core' 'XML-Writer-Tests').
		spec group: 'Soup' with: #('Soup-Core' 'Soup-XPath' 'Soup-Tests-Core' 'Soup-Help').
		spec group: 'OSProcess' with: #('OSProcess-Base' 'OSProcess-Unix' 'OSProcess-Mac' 'OSProcess-Win32' 'OSProcess-AIO' 'OSProcess-OS2' 'OSProcess-RiscOS').
		spec group: 'CommandShell' with: #('CommandShell-Base' 'CommandShell-Commands' 'CommandShell-Piping' 'CommandShell-Tests' 'CommandShell-UI' 'CommandShellPharo' 'CommandShell-Morphic').
		spec group: 'ImageWorkerGroup' with: #('FuelMetalevel' 'ImageWorker').

		spec group: 'Basic' with: #(
			'Collections'
			'XML'
			'Soup' 
			'CI-Core'
			'CI-FogBugzAPI'
			'CI-Validation'
			'CI-Core-Tests').
					
		spec group: 'default' with: #(
			'Basic'
			'OSProcess'
			'CommandShell' 
			'ImageWorkerGroup'
			'CI-ForkedValidation'
			'CI-Loader'
			'CI-Integration').
].