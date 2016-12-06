accessing
processProxy: aProxy
	"An internal evaluation proxy, or an external OS process proxy. Add myself as
	a dependent of aProxy in order to receive notification when the process run
	state changes."

	aProxy addDependent: self.
	processProxy := aProxy