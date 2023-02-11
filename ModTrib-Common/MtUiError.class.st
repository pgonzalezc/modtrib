Class {
	#name : #MtUiError,
	#superclass : #Object,
	#instVars : [
		'descripcion',
		'id'
	],
	#classVars : [
		'TiposGrupo'
	],
	#category : #'ModTrib-Common-Web'
}

{ #category : #'as yet unclassified' }
MtUiError class >> enItem: unaIdentificacion descripcion: unaCadena [

	^ (self basicNew)
		setId: unaIdentificacion;
		setDescripcion: unaCadena.
]

{ #category : #rendering }
MtUiError >> renderErrorOn: html [

	html text: descripcion.
	html space.
	html anchor
		url: 'javascript:void(0)';
		onClick: (html jQuery ajax script: [ :s | 
					 s << (html jQuery id: id) triggerSelect ]);
		with: 'ir'
]

{ #category : #initialization }
MtUiError >> setDescripcion: unaCadena [

	descripcion := unaCadena
]

{ #category : #initialization }
MtUiError >> setId: unaIdentificacion [

	id := unaIdentificacion
]
