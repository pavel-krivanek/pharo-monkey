instance creation
classNameFrom: aNameWithNamespaces
	
	"get class name from Java-like name with namespaces, e.g. Kernel.Tests.Methods.AdditionalMethodStateTest"

	^ aNameWithNamespaces copyAfterLast: $.
	