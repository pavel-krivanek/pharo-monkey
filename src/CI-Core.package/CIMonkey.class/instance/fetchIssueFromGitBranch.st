action
fetchIssueFromGitBranch

	"try to resolve issue from the entry in the GIT_BRANCH environment variable.
	The content of this variable is supposed to be like 'origin/pr/110/head'"
	
	| gitBranch candidates pullRequestId issueId |
	
	self publisher progressMessage: 'Fetching issue from GIT_BRANCH environment variable...'.
	
	gitBranch := OSEnvironment current getEnv: 'GIT_BRANCH'.
	gitBranch ifNil: [ 
		self publisher progressMessage: 'GIT_BRANCH environment variable not set'.
		^ nil ].
	
	candidates := (gitBranch allRegexMatches: '/pr/\d+').
	(candidates size = 1) ifFalse: [ 
		self publisher progressMessage: 'GIT_BRANCH environment variable has a wrong format'.
		^ nil ].

	pullRequestId := candidates first withoutPrefix: '/pr/'.
	
	issueId := self issueIdFromPullRequestId: pullRequestId.
	issueId ifNil: [ 
		self publisher progressMessage: 'failed to resolve issue ID from the pull request ID'.
		^ nil ].
	
	issue := self manager changeWithId: issueId.
	
