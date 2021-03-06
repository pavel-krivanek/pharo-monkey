tests
testFormattingContent
	| formatter writer tagWriter commentWriter piWriter entityRefWriter |

	formatter := XMLWriterRecordingFormatterProxy new.
	(writer := XMLWriter new) formatter: formatter.
	(tagWriter := writer tag: 'empty') write.
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeStartTag: formatAfterEndTag:)
			with: tagWriter).
	
	(tagWriter := writer tag: 'not-empty')
		xmlns: 'defaultNS';
		attributeAt: 'name' put: 'value';
		with: [
			(commentWriter := writer comment) string: 'test'.
			(piWriter := writer pi)
				target: 'test';
				data: 'test'.
			(entityRefWriter := writer entityRef) name: 'test'].
	self assert:
		(formatter
			receivedNext: #formatBeforeStartTag:
			with: tagWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'defaultNS').
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeQuotedStringValue: formatAfterQuotedStringValue:)
			with: 'value').
	self assert:
		(formatter
			receivedNext: #formatAfterStartTag:
			with: tagWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeComment: formatAfterComment:)
			with: commentWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforePI: formatAfterPI:)
			with: piWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeEntityReference: formatAfterEntityReference:)
			with: entityRefWriter).
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeEndTag: formatAfterEndTag:)
			with: tagWriter).

	writer outputsSelfClosingTags: false.
	(tagWriter := writer tag: 'empty') write.
	self assert:
		(formatter
			receivedNextAll: #(formatBeforeStartTag: formatAfterStartTag: formatBeforeEndTag: formatAfterEndTag:)
			with: tagWriter).