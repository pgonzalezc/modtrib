Class {
	#name : #MtModelIdentificacion,
	#superclass : #Object,
	#instVars : [
		'nif',
		'apellidos',
		'nombre',
		'tipoGrupo',
		'nroDeGrupo',
		'telefono',
		'personaDeContacto'
	],
	#category : #'ModTrib-Common-Web'
}

{ #category : #printing }
MtModelIdentificacion >> printOn: aStream [

	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' tipoGrupo: ';
		print: tipoGrupo.
	aStream
		nextPutAll: ' personaDeContacto: ';
		print: personaDeContacto.
	aStream
		nextPutAll: ' apellidos: ';
		print: apellidos.
	aStream
		nextPutAll: ' telefono: ';
		print: telefono.
	aStream
		nextPutAll: ' nif: ';
		print: nif.
	aStream
		nextPutAll: ' nombre: ';
		print: nombre.
	aStream
		nextPutAll: ' nroDeGrupo: ';
		print: nroDeGrupo
]

{ #category : #initialization }
MtModelIdentificacion >> setApellidos: unaCadena [

	apellidos := unaCadena
]

{ #category : #initialization }
MtModelIdentificacion >> setNif: unaCadena [

	nif := unaCadena
]

{ #category : #initialization }
MtModelIdentificacion >> setNombre: unaCadena [

	nombre := unaCadena
]

{ #category : #initialization }
MtModelIdentificacion >> setNroDeGrupo: unNroDeGrupo [

	nroDeGrupo := unNroDeGrupo 
]

{ #category : #initialization }
MtModelIdentificacion >> setPersonaDeContacto: unaCadena [

	personaDeContacto := unaCadena
]

{ #category : #initialization }
MtModelIdentificacion >> setTelefono: unTelefono [

	telefono := unTelefono
]

{ #category : #initialization }
MtModelIdentificacion >> setTipoGrupo: unTipoDeGrupo [

	tipoGrupo := unTipoDeGrupo 
]
