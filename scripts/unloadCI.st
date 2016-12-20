#('BaselineOfCI' 'CI-Core-Tests' 'CI-CommandLine'  'CI-Validation' 'CI-FogBugzAPI'  'CI-Core'  'MCFileTreeGitWriter' 'Soup-Help' 'Soup-Tests-Core' 'Soup-XPath' 'Soup-Core' 'XML-Writer-Tests' 'XML-Writer-Core' 'XML-Tests-Parser' 'XML-Parser' 'Collections-BitmapCharacterSet' 'Collections-OrderPreservingDictionary')
 do: [:packageName | 
 ScriptLoader new unloadPackageNamed: packageName ].
 
 ImageCleaner cleanUpForRelease.
		 