instance creation
pharo30
	^ self new
		addRule:
		(CISUnitTestsRule selectTestCaseBlock: [ :testCaseClass |
				(testCaseClass package name beginsWith: 'Metacello') not]),
			PharoCriticRules pharoIntegrationLintRule harden;
		yourself