Class {
	#name : #MtDevengoSettings,
	#superclass : #Object,
	#classInstVars : [
		'admitePeriodo',
		'periodos',
		'admiteFechaInicio',
		'admiteFechaFin'
	],
	#category : #'ModTrib-Common-Settings'
}

{ #category : #'as yet unclassified' }
MtDevengoSettings class >> admiteAnuales [

	^ self periodos includes: #anuales
]

{ #category : #'as yet unclassified' }
MtDevengoSettings class >> admiteAnuales: aBoolean [

	aBoolean
		ifTrue: [ periodos add: #anuales ]
		ifFalse: [ periodos remove: #anuales ifAbsent: [  ] ]
]

{ #category : #'as yet unclassified' }
MtDevengoSettings class >> admiteCuatrimestrales [

	^ self periodos includes: #cuatrimestrales
]

{ #category : #'as yet unclassified' }
MtDevengoSettings class >> admiteCuatrimestrales: aBoolean [

	aBoolean
		ifTrue: [ periodos add: #cuatrimestrales ]
		ifFalse: [ periodos remove: #cuatrimestrales ifAbsent: [  ] ]
]

{ #category : #accessing }
MtDevengoSettings class >> admiteFechaFin [

	admiteFechaFin ifNil: [ admiteFechaFin := false ].
	^ admiteFechaFin
]

{ #category : #accessing }
MtDevengoSettings class >> admiteFechaFin: aBoolean [

	admiteFechaFin := aBoolean
]

{ #category : #accessing }
MtDevengoSettings class >> admiteFechaInicio [

	admiteFechaInicio ifNil: [ admiteFechaInicio := false ].
	^ admiteFechaInicio
]

{ #category : #accessing }
MtDevengoSettings class >> admiteFechaInicio: aBoolean [

	admiteFechaInicio := aBoolean
]

{ #category : #'as yet unclassified' }
MtDevengoSettings class >> admiteMensuales [

	^ self periodos includes: #mensuales
]

{ #category : #'as yet unclassified' }
MtDevengoSettings class >> admiteMensuales: aBoolean [

	aBoolean ifTrue: [ periodos add: #mensuales ]
		ifFalse: [ periodos remove: #mesuales ifAbsent: [  ] ]
]

{ #category : #'as yet unclassified' }
MtDevengoSettings class >> admiteTrimestrales [

	^ self periodos includes: #trimestrales
]

{ #category : #'as yet unclassified' }
MtDevengoSettings class >> admiteTrimestrales: aBoolean [

	aBoolean
		ifTrue: [ periodos add: #trimestrales ]
		ifFalse: [ periodos remove: #trimestrales ifAbsent: [  ] ]
]

{ #category : #'as yet unclassified' }
MtDevengoSettings class >> descripcionPeriodosAdmitidos [

	| collation |
	collation := #( #mensuales #trimestrales #cuatrimestrales
	                #anuales ).
	^ (collation select: [ :each | self periodos includes: each ])
		  inject: OrderedCollection new
		  into: [ :acc :each | 
			  acc
				  addAll: (MtPeriodo perform: each);
				  yourself ]
]

{ #category : #accessing }
MtDevengoSettings class >> periodos [

	periodos ifNil: [ periodos := Set new ].
	^ periodos
]

{ #category : #settings }
MtDevengoSettings class >> settingsOn: aBuilder [

	(aBuilder setting: #admiteFechaInicio)
		label: '¿Admite fecha de inicio?' translated;
		description:
			'Marque esta opción si el modelo requiere fecha de inicio de devengo.';
		target: self.
	(aBuilder setting: #admiteFechaFin)
		label: '¿Admite fecha de fin?' translated;
		description:
			'Marque esta opción si el modelo requiere fecha de fin de devengo.';
		target: self
]

{ #category : #'as yet unclassified' }
MtDevengoSettings class >> settingsPeriodosOn: aBuilder [

	(aBuilder setting: #admiteMensuales)
				label: '¿Admite presentaciones mensuales?';
				description:
					'Marque esta opción si el modelo admite presentaciones mensuales.';
				target: self.
			(aBuilder setting: #admiteAnuales)
				label: '¿Admite presentación anual?';
				description:
					'Marque esta opción si el modelo admite presentación anual.';
				target: self.
			(aBuilder setting: #admiteTrimestrales)
				label: '¿Admite presentación trimestrales?';
				description:
					'Marque esta opción si el modelo admite presentaciones trimestrales.';
				target: self.
			(aBuilder setting: #admiteCuatrimestrales)
				label: '¿Admite presentación cuatrimestral?';
				description:
					'Marque esta opción si el modelo admite presentaciones cuatrimestrales.';
				target: self
]
