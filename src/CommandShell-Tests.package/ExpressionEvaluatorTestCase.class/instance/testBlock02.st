Testing
testBlock02
	"Evaluating an MNU"

	"(self selector: #testBlock02) run"

	pipeJunction := ExpressionEvaluator block: [Smalltalk noSuchMessage].
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
	self should: [('MessageNotUnderstood: *noSuchMessage', String lf)
 				match: pipeJunction errorUpToEnd]