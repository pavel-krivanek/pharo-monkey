action
fetchIssueFromSha1

	"try to resolve issue from the entry in the 'sha1' environment variable.
	The content of this variable is supposed to be like 'origin/pr/110/head'"
	
	| gitBranch candidates pullRequestId issueId |
	
	self publisher progressMessage: 'Fetching issue from sha1 environment variable...'.
	
	gitBranch := OSEnvironment current getEnv: 'sha1'.
	gitBranch ifNil: [ 
		self publisher progressMessage: 'sha1 environment variable not set'.
		^ nil ].
	
	candidates := (gitBranch allRegexMatches: '/pr/\d+').
	(candidates size = 1) ifFalse: [ 
		self publisher progressMessage: 'sha1 environment variable has a wrong format'.
		^ nil ].

	pullRequestId := candidates first withoutPrefix: '/pr/'.
	
	issueId := self issueIdFromPullRequestId: pullRequestId.
	issueId ifNil: [ 
		self publisher progressMessage: 'failed to resolve issue ID from the pull request ID'.
		^ nil ].
	
	issue := self manager changeWithId: issueId.
	
