Class {
	#name : #M795TipoDeclaracionSettings,
	#superclass : #MtTipoDeclaracionSettings,
	#category : #'ModTrib-Common-Settings'
}

{ #category : #initialization }
M795TipoDeclaracionSettings class >> defaultSettings [

	self admiteSustitutiva: false.
	self admiteRectificativa: false
]

{ #category : #'as yet unclassified' }
M795TipoDeclaracionSettings class >> settingsOn: aBuilder at: aParent [

	(aBuilder group: #m795TipoDeclaracion)
		label: 'Tipo de declaración' translated;
		description: 'Permite indicar si el modelo admite declaraciones sustitutivas y/o rectificativas';
		parent: aParent;
		with: [ self settingsOn: aBuilder ]
]
