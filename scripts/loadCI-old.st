| versions pharoRepo fuelRepo loader |

Metacello new
  baseline: 'Iceberg';
  repository: 'github://npasserini/iceberg';
  load.

Gofer it
    smalltalkhubUser: 'Pharo' project: 'ci';
    configurationOf: 'CI';
    loadStable.
    
"fix overrides"    

versions := ScriptLoader new perform: (#script, SystemVersion current highestUpdate asString) asSymbol.

pharoRepo := MCHttpRepository
	location: 'http://smalltalkhub.com/mc/Pharo/Pharo60/main'
	user: ''
	password: ''.
	
fuelRepo := MCSmalltalkhubRepository
	owner: 'Pharo'
	project: 'Fuel'
	user: ''
	password: ''.
	
loader := MCVersionLoader new.
loader addVersion: (fuelRepo loadVersionFromFileNamed: (
	versions detect: [ :each | each beginsWith: 'Fuel-' ])).
loader addVersion: (pharoRepo loadVersionFromFileNamed: 
	(versions detect: [ :each | each beginsWith: 'Metacello-Core-' ])).
loader addVersion: (pharoRepo loadVersionFromFileNamed: 
	(versions detect: [ :each | each beginsWith: 'MonticelloGUI' ])).
loader addVersion: (pharoRepo loadVersionFromFileNamed: 
	(versions detect: [ :each | each beginsWith: 'Polymorph-Widgets-' ])).
loader addVersion: (pharoRepo loadVersionFromFileNamed: 
	(versions detect: [ :each | each beginsWith: 'MonticelloFileTree-Core-' ])).
[loader load] on: MCMergeOrLoadWarning do: [ :ex | ex load ].
