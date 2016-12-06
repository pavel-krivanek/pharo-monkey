applying
applyConfiguration
	ScriptLoader new 
		loadConfiguration: self case configurationName 
		version: self case configurationVersionOrDefault
