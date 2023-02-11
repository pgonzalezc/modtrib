Class {
	#name : #MtTiposGrupo,
	#superclass : #Object,
	#instVars : [
		'codigo',
		'descripcion'
	],
	#classVars : [
		'TiposGrupo'
	],
	#category : #'ModTrib-Common-Web'
}

{ #category : #'as yet unclassified' }
MtTiposGrupo class >> conCodigo: aSymbol descripcion: aString [

	^ self basicNew
		  setCodigo: aSymbol;
		  setDescripcion: aString
]

{ #category : #initialization }
MtTiposGrupo class >> initialize [

	TiposGrupo := Dictionary new.
	TiposGrupo
		at: #regimenConsolidacionFiscal put: (self
				 conCodigo: #regimenConsolidacionFiscal
				 descripcion: 'Grupo fiscal régimen consolidación fiscal IS');
		at: #regimenMercantil
		put:
			(self
				 conCodigo: #regimenMercantil
				 descripcion: 'Grupo mercantil IS')		
]

{ #category : #'as yet unclassified' }
MtTiposGrupo class >> regimenConsolidacionFiscal [

	^ TiposGrupo at: #regimenConsolidacionFiscal
]

{ #category : #'as yet unclassified' }
MtTiposGrupo class >> regimenMercantil [

	^ (TiposGrupo at: #regimenMercantil)
]

{ #category : #printing }
MtTiposGrupo >> printOn: aStream [

	"Append a sequence of characters to aStream that identify the receiver."

	aStream print: codigo
]

{ #category : #initialization }
MtTiposGrupo >> setCodigo: aSymbol [

	codigo := aSymbol
]

{ #category : #initialization }
MtTiposGrupo >> setDescripcion: aString [

	descripcion := aString
]
