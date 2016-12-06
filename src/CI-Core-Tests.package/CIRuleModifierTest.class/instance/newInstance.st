accessing
newInstance
	^ (self ruleClass 
		rule: self newValidationRule)
		validator: CIValidator forCurrentVersion;
		yourself. 