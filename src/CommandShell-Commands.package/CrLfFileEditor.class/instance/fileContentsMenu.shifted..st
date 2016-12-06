model access
fileContentsMenu: aMenu shifted: shifted

| shiftMenu |
^ shifted 
	ifFalse: [aMenu 
		labels: 
'save
save as...
exit
view as hex
view as text
browse changes
find...(f)
find again (g)
set search string (h)
do again (j)
undo (z)
copy (c)
cut (x)
paste (v)
paste...
do it (d)
print it (p)
inspect it (i)
fileIn selection
accept (s)
cancel (l)
more...' 
		lines: #(3 6 9 11 15 19 21)
		selections: #(save saveAs exit getHex getText browseChanges
find findAgain setSearchString
again undo
copySelection cut paste pasteRecent
doIt printIt inspectIt fileItIn
accept cancel
shiftedYellowButtonActivity)]

	ifTrue: [shiftMenu := (Smalltalk at: #ParagraphEditor) shiftedYellowButtonMenu.
		aMenu 
			labels: shiftMenu labelString 
			lines: shiftMenu lineArray
			selections: shiftMenu selections]

