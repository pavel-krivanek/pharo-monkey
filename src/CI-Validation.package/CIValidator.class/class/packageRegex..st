instance creation
packageRegex: aRegex
	^ self new
		addRule:
		(CISUnitTestsRule packageRegex: aRegex),
			PharoCriticRules pharoIntegrationLintRule harden;
		yourself