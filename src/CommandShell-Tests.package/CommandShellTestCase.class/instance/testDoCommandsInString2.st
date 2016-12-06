testing-pipelines
testDoCommandsInString2
	"Note, use #upToEndOfFile to allow external process to run to completion"

	"(CommandShellTestCase selector: #testDoCommandsInString2) debug"

	| command procs expectedResult savedResult |

	command := 'who | CommandShellTestCase tempResult: stdin upToEndOfFile !'.
	procs := shell pipeline: 'who'.
	expectedResult := procs last output.
	self should: [expectedResult size > 10].
	self class tempResult: nil.
	shell command: command.
	(Delay forSeconds: 1) wait.	"Allow the command to run"
	savedResult := self class tempResult.
	self assert: expectedResult size > 10. "not empty"
	self assert: expectedResult = savedResult
