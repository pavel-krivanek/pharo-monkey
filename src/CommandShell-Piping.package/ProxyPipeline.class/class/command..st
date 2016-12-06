command processing
command: aCommandString
	"Evaluate a new instance created from aCommandString. Sender is responsible
	for closing the pipes with #closePipes or #finalize."

	"ProxyPipeline command: 'ls | cat | wc'"
	"ProxyPipeline command: 'ls NOSUCHFILE * | cat | wc'"
	"ProxyPipeline command: 'ls | copyToOutput | wc'"
	"ProxyPipeline command: ''"

	Smalltalk at: #CommandShell
		ifPresent: [ :cls | ^ self command: aCommandString shell: cls new ].
	self notify: 'CommandShell not found'
