tools
closeOldIssues

	| issues |
	issues := self getIssuesForQuery: 'status:Open orderBy:"-lastupdated"' max: 5.
	issues do: [ :each | 
		DateAndTime now - each lastModification > 1 year ifTrue: [ 
			each 
				statusStaleTimeout;
				saveStatus: 'Pharo is moving fast: We release a new major version every year, with many, many changes.
Issue tracker entries tend to get stale after a new release. Bugs are fixed, subsystems
replaced or removed.

After seeing many out-dated, very old issues staying around forever, we have adopted the
following policy:

- Issues that do not see ​*any*​ activity are closed autmatically after one year of inactivity.
- This is done by a completely automated job which closes up to 5 issues per day older than
one year.

The issue can (and should!) be re-opened if it is still relavant in the current development
version!';
				close
			 ]				
 	]