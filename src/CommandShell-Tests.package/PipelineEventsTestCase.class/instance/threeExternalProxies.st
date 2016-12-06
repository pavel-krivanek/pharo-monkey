private - pipeline creation
threeExternalProxies

	^ ProxyPipeline fromString: 'ps | cat | cat' shell: CommandShell new
