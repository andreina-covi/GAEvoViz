adding
addSurvivor: object on: collection using: set generation: integer fitness: float and: memo
	| selected association |
	association := object generation -> object position.
	selected := object generation == integer and: [ (memo at: integer of: object position) at: 'fitness' = float ].
	selected ifFalse: [ 
		object children do: [ :each | | included |
			included := (set includes: each generation -> each position) or: [ 
				self addSurvivor: each on: collection using: set generation: integer fitness: float and: memo ].
			selected := selected or: [ included ] ]	
	].
	selected ifTrue: [ 
		(set includes: association) 
			ifFalse: [ 
				set add: association.
				collection add: object ].
			^ true	
	].
	^ false