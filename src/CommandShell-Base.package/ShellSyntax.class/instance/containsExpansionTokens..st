globbing
containsExpansionTokens: aString
	"Answer true if aString contains wildcard expansion characters, or if it contains
	anything that might be construed as a regular expression for globbing, or if it
	contains path separator characters. If false, the sender may safely skip normal
	glob expansion on aString."

	^ aString includesAnyOf: {$? . $* . $[ . CommandShell pathNameDelimiter}
