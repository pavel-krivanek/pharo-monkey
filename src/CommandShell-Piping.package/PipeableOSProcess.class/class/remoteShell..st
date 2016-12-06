utility
remoteShell: remoteSystemName 
	"Start a remote Unix shell on another computer"

	"self remoteShell: 'localhost'"

	| proxyClass |
	(proxyClass := self externalProxyClass) ifNotNil:
		[^ self
			forkAndExec: proxyClass remoteShellPath
			arguments: (Array with: remoteSystemName with: 'sh')
			environment: nil
			descriptors: nil
			workingDir: nil
			errorPipelineStream: nil].
	^ self notify: 'OSProcess not available'


