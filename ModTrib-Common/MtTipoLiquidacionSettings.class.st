Class {
	#name : #MtTipoLiquidacionSettings,
	#superclass : #Object,
	#classInstVars : [
		'tiposAdmitidos'
	],
	#category : #'ModTrib-Common-Settings'
}

{ #category : #'as yet unclassified' }
MtTipoLiquidacionSettings class >> admiteIngreso [

	^ self tiposAdmitidos includes: #ingreso
]

{ #category : #'as yet unclassified' }
MtTipoLiquidacionSettings class >> admiteIngreso: aBoolean [

	aBoolean ifTrue: [ tiposAdmitidos add: #ingreso ]
				ifFalse: [ tiposAdmitidos remove: #ingreso ifAbsent: [ ]  ]
]

{ #category : #'as yet unclassified' }
MtTipoLiquidacionSettings class >> settingsOn: aBuilder at: aParent [

	(aBuilder setting: #admiteIngreso)
		label: 'Ingreso con NRC' translated;
		description: 'Marque esta opción si el modelo admite tipos de liquidación ingreso con NRC';
		parent: aParent;
		target: self
]

{ #category : #accessing }
MtTipoLiquidacionSettings class >> tiposAdmitidos [

	tiposAdmitidos ifNil: [ tiposAdmitidos := Set new ].
	^ tiposAdmitidos 
]
