instance-creation
default

	^ self fromDirectory: (OSPlatform current environment getEnv: 'PWD')