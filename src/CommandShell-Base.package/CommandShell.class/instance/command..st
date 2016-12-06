evaluation
command: aCommandString
	"Evaluate aCommandString. Answer a collection of evaluated pipelines,
	or nil if nothing was done."

	"CommandShell new command: 'ls -l | cat'"
	"CommandShell new open; command: 'ls -l | cat'"
	"CommandShell new open; command: 'who'"
	"CommandShell new open; command: 'who&'"
	"CommandShell new open; command: 'sol'"
	"CommandShell new command: 'sol'"

	^self command: aCommandString echo: true
