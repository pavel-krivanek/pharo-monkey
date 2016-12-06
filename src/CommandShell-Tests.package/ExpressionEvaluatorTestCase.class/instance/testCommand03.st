Testing
testCommand03
	"Command consisting of the Compiler evaluating an Array new"

	"(self selector: #testCommand03) run"

	pipeJunction := ExpressionEvaluator command: 'Array with: #foo with: #bar'.
	self should: [pipeJunction runState == #notYetRunning].
	self shouldnt: [pipeJunction isComplete].
	self should: [pipeJunction pipeToInput isNil].
	self should: [pipeJunction pipeFromOutput isKindOf: InternalPipe].
	self should: [pipeJunction errorPipelineStream isKindOf: InternalPipe].
	self should: [pipeJunction exitStatus isNil].
	self should: [pipeJunction output isEmpty].
	self should: [pipeJunction errorUpToEnd isEmpty].
	pipeJunction value.
	self should: [pipeJunction runState == #complete].
	self should: [pipeJunction isComplete].
	self should: [pipeJunction exitStatus == #success].
	self should: [pipeJunction succeeded].
	self should: [pipeJunction upToEnd = ('#(#foo #bar)', String lf)].
	self should: [pipeJunction errorUpToEnd isEmpty].
