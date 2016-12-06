accessing
newInstance
	^ self ruleClass asCIValidationRule 
		validator: CIValidator forCurrentVersion;
		yourself.  