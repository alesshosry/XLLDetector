as yet unclassified
extractColumnsIdentifiersFromCondition: condition

	|columnsIdentifiers generalPattern|
	columnsIdentifiers := OrderedCollection new.
	
	generalPattern := XLLSQLPatterns new.
	
	(generalPattern defineSQLConditionWithIdentifiers match: condition) matchingContexts do: [ :eachContext |
		|xllColumnIdentifier|
		xllColumnIdentifier := XLLSQLColumn new.
		xllColumnIdentifier name: (eachContext bindings at: 'columnName').
		xllColumnIdentifier alias: (eachContext bindings at: 'tableIdentifier'). 
		columnsIdentifiers add: xllColumnIdentifier.
	].

	(generalPattern defineSQLConditionWithoutIdentifiers1 match: condition) matchingContexts do: [ :eachContext |
		|xllColumnIdentifier|
		xllColumnIdentifier := XLLSQLColumn new.
		xllColumnIdentifier name: (eachContext bindings at: 'columnName').
		columnsIdentifiers add: xllColumnIdentifier.
	].

	(generalPattern defineSQLConditionWithoutIdentifiers2 match: condition) matchingContexts do: [ :eachContext |
		|xllColumnIdentifier|
		xllColumnIdentifier := XLLSQLColumn new.
		xllColumnIdentifier name: (eachContext bindings at: 'columnName').
		columnsIdentifiers add: xllColumnIdentifier.
	].

	^ columnsIdentifiers .