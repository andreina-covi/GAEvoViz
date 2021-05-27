accessing
comparisonSelector: symbol
	self assert: (symbol isSymbol and: [ #(#> #< #>= #<= #= #==) includes: symbol ]).
	comparisonSelector := symbol