validating
validatePrefix: aPrefix ofAttribute: anAttribute hasNoAliasesin: aDictionaryOrSet
	| namespace oldSize |

	namespace := self validateAndResolvePrefix: aPrefix.

	"#add: and a #size check after is faster than #includes: or #includesKey:
	and works for both Sets and Dictionaries"
	oldSize := aDictionaryOrSet size.
	(aDictionaryOrSet
		add: (anAttribute xmlLocalNameAfterPrefix: aPrefix) -> namespace;
		size) > oldSize
		ifFalse: [
			self
				errorAttribute: anAttribute
				aliasesNamespace: namespace]