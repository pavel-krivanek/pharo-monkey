accessing
safeToExit: trueOrFalse
	"This is a guard variable to prevent the user from running a command line containing both
	a snapshot command and an exit command. This prevents the user from entering a command
	such as 'snapshot; exit' which would cause the image to immediately exit when next restarted."

	safeToExit := trueOrFalse
