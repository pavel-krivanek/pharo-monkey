parsing
parseQuery
	| query key value |

	query := OrderPreservingStringDictionary new.
	(self peekFor: $?)
		ifFalse: [^ query].

	[self atEnd
		or: [(key := self nextDelimitedBy: QueryKeyDelimiters) isEmpty
			and: [self peek == $#]]]
		whileFalse: [| hasValue |
			(hasValue := self peekFor: $=)
				ifTrue: [value := self nextDelimitedBy: QueryValueDelimiters]
				ifFalse: [value := ''].
			(key notEmpty
				or: [hasValue])
				ifTrue: [
					query
						at: key
						put: value].
			self peekFor: $&].

	^ query.