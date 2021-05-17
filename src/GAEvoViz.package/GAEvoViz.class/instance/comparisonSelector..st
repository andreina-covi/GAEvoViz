as yet unclassified
comparisonSelector: symbol
	self assert: (symbol isSymbol and: [ #(#> #< #>= #<= #= #==) includes: symbol ]).
	comparisonSelector := symbol