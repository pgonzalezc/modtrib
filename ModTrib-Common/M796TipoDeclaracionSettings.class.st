Class {
	#name : #M796TipoDeclaracionSettings,
	#superclass : #MtTipoDeclaracionSettings,
	#category : #'ModTrib-Common-Settings'
}

{ #category : #'as yet unclassified' }
M796TipoDeclaracionSettings class >> settingsOn: aBuilder at: aParent [

	(aBuilder group: #m796TipoDeclaracion)
		label: 'Tipo de declaración' translated;
		description: 'Permite indicar si el modelo admite declaraciones sustitutivas y/o rectificativas';
		parent: aParent;
		with: [ self settingsOn: aBuilder ]
]
