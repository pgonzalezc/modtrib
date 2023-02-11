Class {
	#name : #MtViewIngreso,
	#superclass : #MtViewBase,
	#instVars : [
		'formaDePago',
		'importe',
		'swiftBic',
		'iban'
	],
	#category : #'ModTrib-Common-Web'
}

{ #category : #'as yet unclassified' }
MtViewIngreso >> defaultConfig [
]

{ #category : #checking }
MtViewIngreso >> esValida [ 

	^ true
]

{ #category : #'as yet unclassified' }
MtViewIngreso >> listaFormasDePago [

	^ #('Ingresar' 'Simple reconocimiento de deuda')
]

{ #category : #'as yet unclassified' }
MtViewIngreso >> modelValue [ 

	^ MtModelIngreso new
]

{ #category : #rendering }
MtViewIngreso >> renderContentOn: html [

	html container: [ 
		html card: [ 
			html cardHeader: [ self renderHeaderOn: html ].
			html cardBody: [ 
				self renderSelectFormaDePagoOn: html.
				self renderInputImporteOn: html.
				self renderInputSwiftBicOn: html ] ] ]
]

{ #category : #rendering }
MtViewIngreso >> renderHeaderOn: html [

	html heading level: 5; with: 'Ingreso'
]

{ #category : #rendering }
MtViewIngreso >> renderInputImporteOn: html [

	html formGroup: [ 
		html label
			for: 'input-importe';
			with: 'Importe'.
		html textInput formControl; id: 'input-importe' ]
]

{ #category : #'as yet unclassified' }
MtViewIngreso >> renderInputSwiftBicOn: html [

	html formGroup: [ 
		html label
			for: 'input-swift-bic';
			with: 'Código BIC/Swift'.
		html textInput
			formControl;
			id: 'input-swift-bic' ]
]

{ #category : #rendering }
MtViewIngreso >> renderSelectFormaDePagoOn: html [

	html formGroup: [ 
		html label for: 'select-forma-de-pago'; with: 'Forma de pago'.
		html select formControl; list: self listaFormasDePago
		 ]
]
