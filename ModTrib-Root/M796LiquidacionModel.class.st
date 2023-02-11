Class {
	#name : #M796LiquidacionModel,
	#superclass : #Object,
	#instVars : [
		'partidas',
		'reglas'
	],
	#category : #'ModTrib-Root-796'
}

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> aplicaReglas [

	reglas do: [ :each | each value ]
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> inicializaPartidas [

	partidas := (Array new: 10 withAll: 0.0)
		            at: 4 put: 100.0;
		            at: 7 put: 100.0;
						yourself
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> inicializaReglas [

		reglas := OrderedCollection new
			          add: [ partidas at: 3 put: self p01 - self p02 ];
			          add: [ partidas at: 5 put: self p03 * self p04 / 100.0 ];
			          add: [ partidas at: 6 put: self p03 ];
			          add: [ partidas at: 8 put: self p06 * self p07 / 100.0 ];
			          add: [ partidas at: 10 put: self p08 - self p09 ];
			          yourself 
]

{ #category : #initialization }
M796LiquidacionModel >> initialize [

	super initialize.
	self inicializaPartidas.
	self inicializaReglas
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p01 [ 

	^ partidas at: 1
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p01: aValue [

	partidas at: 1 put: aValue.
	self aplicaReglas 
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p02 [

	^ partidas at: 2
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p02: aValue [

	partidas at: 2 put: aValue.
	self aplicaReglas
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p03 [

	^ partidas at: 3
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p04 [

	^ partidas at: 4
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p04: aValue [

	partidas at: 4 put: aValue.
	self aplicaReglas
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p05 [

	^ partidas at: 5
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p06 [

	^ partidas at: 6
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p07 [

	^ partidas at: 7
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p07: aValue [

	partidas at: 7 put: aValue.
	self aplicaReglas
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p08 [

	^ partidas at: 8
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p09 [

	^ partidas at: 9
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p09: aValue [

	partidas at: 9 put: aValue.
	self aplicaReglas
]

{ #category : #'as yet unclassified' }
M796LiquidacionModel >> p10 [

	^ partidas at: 10
]

{ #category : #printing }
M796LiquidacionModel >> printOn: aStream [

	aStream nextPutAll: ('{1} [' format: { self class name }).
	aStream nextPutAll:
		($, join: (partidas collect: [ :aNumber | aNumber asString ])).
	aStream
		nextPutAll: ']';
		cr
]
