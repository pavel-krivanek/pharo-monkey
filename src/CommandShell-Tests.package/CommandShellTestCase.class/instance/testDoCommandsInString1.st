testing-pipelines
testDoCommandsInString1

	"(CommandShellTestCase selector: #testDoCommandsInString1) debug"

	| command procs expectedResult savedResult |

	command := 'help help | CommandShellTestCase tempResult: stdin upToEndOfFile !'.
	procs := shell pipeline: 'help help'.
	expectedResult := procs last output.
	self should: [expectedResult size > 10].
	self class tempResult: nil.
	shell command: command.
	(Delay forSeconds: 1) wait.	"Allow the command to run"
	savedResult := self class tempResult.
	self assert: expectedResult size > 10. "not empty"
	self assert: expectedResult = savedResult
