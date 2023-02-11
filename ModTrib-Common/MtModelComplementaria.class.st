Class {
	#name : #MtModelComplementaria,
	#superclass : #Object,
	#instVars : [
		'tipo',
		'nroJustificanteAnterior'
	],
	#category : #'ModTrib-Common-Web'
}

{ #category : #'as yet unclassified' }
MtModelComplementaria class >> conTipo: aSymbol yNroJustificanteAnterior: aString [

	^ self basicNew
		  setTipo: aSymbol;
		  setNroJustificanteAnterior: aString
]

{ #category : #printing }
MtModelComplementaria >> printOn: aStream [

	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' tipo: ';
		print: tipo.
	aStream
		nextPutAll: ' nroJustificanteAnterior: ';
		print: nroJustificanteAnterior
]

{ #category : #initialization }
MtModelComplementaria >> setNroJustificanteAnterior: aString [

	nroJustificanteAnterior := aString
]

{ #category : #initialization }
MtModelComplementaria >> setTipo: aSymbol [

	tipo := aSymbol
]
