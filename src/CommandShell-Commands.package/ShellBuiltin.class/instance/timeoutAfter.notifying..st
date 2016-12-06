private
timeoutAfter: milliseconds notifying: sema
	"Under certain conditions it is possible to receive a false negative on
	and end of file check (for example, closing the writer end of a pipe
	from Squeak, and immediately checking for end of file on the reader
	in the same Squeak method). If looping while waiting on end of file,
	this timeout method can be used to prevent a deadlock condition."

	[(Delay forMilliseconds: milliseconds) wait.
	sema signal] fork