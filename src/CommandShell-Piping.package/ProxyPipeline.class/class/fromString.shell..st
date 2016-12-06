instance creation
fromString: aCommandString shell: aCommandShell
	"Answer a new instance created from aCommandString using aCommandShell."

	"ProxyPipeline fromString: 'ls | cat | wc' shell: CommandShell new"
	"ProxyPipeline fromString: 'ls NOSUCHFILE * | cat | wc' shell: CommandShell new"
	"ProxyPipeline fromString: 'ls | copyToOutput | wc' shell: CommandShell new "
	"ProxyPipeline fromString: '' shell: CommandShell new"

	^ super new fromString: aCommandString shell: aCommandShell
