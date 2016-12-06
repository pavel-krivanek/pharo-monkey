class initialization
headlessChild: boolean
	"If true (default), the child process is headless. Set to false to allow debugging in
	the child Squeak image"

	"RemoteTask headlessChild:true"
	"RemoteTask headlessChild:false" "for debugging the child image"

	HeadlessChild := boolean