Class {
	#name : #MtModelDevengo,
	#superclass : #Object,
	#instVars : [
		'ejercicio',
		'fechaInicio',
		'fechaFin'
	],
	#category : #'ModTrib-Common-Web'
}

{ #category : #'as yet unclassified' }
MtModelDevengo class >> enEjercicio: anInteger [

	^ (self basicNew)
		setEjercicio: anInteger
]

{ #category : #'as yet unclassified' }
MtModelDevengo class >> enEjercicio: anInteger conFechaInicio: aDateTime [

	^ self basicNew setEjercicio: anInteger; setFechaInicio: aDateTime
]

{ #category : #'as yet unclassified' }
MtModelDevengo class >> enEjercicio: anInteger conFechaInicio: aDateTime yFechaFin: anotherDateTime [

	^ self basicNew
		  setEjercicio: anInteger;
		  setFechaInicio: aDateTime;
		  setFechaFin: anotherDateTime 
]

{ #category : #accessing }
MtModelDevengo >> ejercicio [

	"Devuelve el ejercicio del devengo"
	^ ejercicio
]

{ #category : #accessing }
MtModelDevengo >> periodoImpositivo [

	"Devuelve el periodo impositivo del devengo, si existe sino devuelve nil"
	fechaInicio ifNil: [ ^ nil ].
	^ Interval from: fechaInicio to: fechaFin
]

{ #category : #printing }
MtModelDevengo >> printOn: aStream [

	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' fechaInicio: ';
		print: fechaInicio.
	aStream
		nextPutAll: ' ejercicio: ';
		print: ejercicio.
	aStream
		nextPutAll: ' fechaFin: ';
		print: fechaFin
]

{ #category : #'private - initialization' }
MtModelDevengo >> setEjercicio: anInteger [

	ejercicio := anInteger
]

{ #category : #'private - initialization' }
MtModelDevengo >> setFechaFin: aDateTime [

	fechaFin := aDateTime
]

{ #category : #'private - initialization' }
MtModelDevengo >> setFechaInicio: aDateTime [

	fechaInicio := aDateTime 
]

{ #category : #accessing }
MtModelDevengo >> tienePeriodoImpositivo [ 

	^ (fechaInicio isNotNil)
]
