command processing
command: aCommandString shell: aCommandShell
	"Evaluate a new instance created from aCommandString using aCommandShell.
	Sender is responsible for closing the pipes #closePipes or #finalize."

	"ProxyPipeline command: 'ls | cat | wc' shell: CommandShell new"
	"ProxyPipeline command: 'ls NOSUCHFILE * | cat | wc' shell: CommandShell new"
	"ProxyPipeline command: 'ls | copyToOutput | wc' shell: CommandShell new "
	"ProxyPipeline command: '' shell: CommandShell new"

	^ (self fromString: aCommandString shell: aCommandShell) value
