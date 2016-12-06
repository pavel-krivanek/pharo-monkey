*CommandShellPharo
menuCommandOn: aBuilder
	"World menu registration for Pharo images. This must be package separately
	from CommandShell proper, because pragmas are not supported in Squeak 3.8
	and earlier, and MVC is broken in later images. Since CommandShell is designed
	to work with MVC, use of pragmas is unacceptable here."
 	<worldMenu>
	(aBuilder item: #'Command shell')
		parent: #Tools;
		action:[self new open]