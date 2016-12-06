accessing
newInstance
	^ self ruleClass new 
		validator: CIValidator forCurrentVersion;
		yourself. 