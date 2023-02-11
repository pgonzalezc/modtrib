Class {
	#name : #MtTipoDeclaracionSettings,
	#superclass : #Object,
	#classInstVars : [
		'admiteSustitutiva',
		'admiteRectificativa'
	],
	#category : #'ModTrib-Common-Settings'
}

{ #category : #accessing }
MtTipoDeclaracionSettings class >> admiteRectificativa [

	admiteRectificativa ifNil: [ admiteRectificativa := false ].
	^ admiteRectificativa 
]

{ #category : #accessing }
MtTipoDeclaracionSettings class >> admiteRectificativa: aBoolean [

	admiteRectificativa := aBoolean
]

{ #category : #accessing }
MtTipoDeclaracionSettings class >> admiteSustitutiva [

	admiteSustitutiva ifNil: [ admiteSustitutiva := false ].
	^ admiteSustitutiva 
]

{ #category : #accessing }
MtTipoDeclaracionSettings class >> admiteSustitutiva: aBoolean [

	admiteSustitutiva := aBoolean
]

{ #category : #initialization }
MtTipoDeclaracionSettings class >> defaultSettings [ 

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
MtTipoDeclaracionSettings class >> settingsOn: aBuilder [ 

	(aBuilder setting: #admiteSustitutiva)
		label: '¿Admite sustitutiva?' translated;
		description:
			'Marque esta opción si el modelo admite declaraciones sustitutivas';
		target: self.
	(aBuilder setting: #admiteRectificativa)
		label: '¿Admite Rectificativa?' translated;
		description:
			'Marque esta opción si el modelo admite declaraciones rectificativas';
		target: self
]
