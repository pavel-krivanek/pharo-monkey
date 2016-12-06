instance creation
pharo60
	| excludedTests |
	
	"I do not want to test any of this packages"
	excludedTests := #('Metacello-' 'CI-' 'ImageWorker' 'XML-' 'OSProcess-' 'CommandShell-').
	^ self new
		addRule:
		(CISUnitTestsRule selectTestCaseBlock: [ :testCaseClass |
				(excludedTests noneSatisfy: [ :each | (testCaseClass package name beginsWith: each)]) 
				and: [ testCaseClass ~=  ReleaseTest]]),
			PharoCriticRules pharoIntegrationLintRule harden;
		yourself