Testing
testCommand04
	"Evaluating an error condition, no such class"

	"(self selector: #testCommand04) run"

	pipeJunction := ExpressionEvaluator command: 'NoSuchClass new'.
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
	self should: [pipeJunction exitStatus == #fail].
	self shouldnt: [pipeJunction succeeded].
	self should: [pipeJunction upToEnd isEmpty].
	self should: [pipeJunction errorUpToEnd = ('Compiler: invalid Smalltalk expression [NoSuchClass new]', String lf)].
