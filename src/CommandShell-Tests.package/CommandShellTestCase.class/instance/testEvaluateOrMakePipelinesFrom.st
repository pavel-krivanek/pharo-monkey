testing-expression evaluator
testEvaluateOrMakePipelinesFrom

	"(CommandShellTestCase selector: #testEvaluateOrMakePipelinesFrom) debug"

	| command result firstPipeline secondPipeline thirdPipeline firstErrorMessage firstOutput openFileCount |

	openFileCount := self numberOfOpenFiles.
	command := 'ls NOSUCHFILE * | cat | dd | cat | wc; ps | cat& pwd | cat'.
	result := shell evaluateOrMakePipelinesFrom: command.
	result do: [:e | e value].
	self assert: result size == 3.
	firstPipeline := result at: 1.
	secondPipeline := result at: 2.
	thirdPipeline := result at: 3.
	firstOutput := firstPipeline output.
	self assert: ('   *' match: firstOutput).
	firstErrorMessage := firstPipeline errorUpToEnd.
	self assert: ('*NOSUCHFILE*' match: firstErrorMessage).
	self deny: secondPipeline output isEmpty.
	self assert: secondPipeline errorUpToEnd isEmpty.
	self deny: thirdPipeline output isEmpty.
	self assert: thirdPipeline errorUpToEnd isEmpty.
	self should: [self isNumberOfOpenFiles: openFileCount]