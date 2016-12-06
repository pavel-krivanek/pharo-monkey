instance creation
command: aString

	"(self command: '''Hello world!''') value upToEnd"

	^ self basicNew command: aString
