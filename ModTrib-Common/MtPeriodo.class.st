Class {
	#name : #MtPeriodo,
	#superclass : #Object,
	#instVars : [
		'codigo',
		'descripcion'
	],
	#classVars : [
		'Cuatrimestrales',
		'Mensuales',
		'Tipos',
		'Trimestrales'
	],
	#category : #'ModTrib-Common-Web'
}

{ #category : #'as yet unclassified' }
MtPeriodo class >> abril [

	^ Tipos at: #abril
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> agosto [

	^ Tipos at: #agosto
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> anual [

	^ Tipos at: #anual
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> anuales [ 

	^ OrderedCollection with: (self anual)
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> codigo: aCodeString descripcion: aString [

	^ self basicNew 
		  setCodigo: aCodeString;
		  setDescripcion: aString
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> cuartoTrimestre [ 

	^ Tipos at: #cuartoTrimestre
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> cuatrimestrales [

	"Devuelve un OrderedCollection con los periodos cuatrimestrales"

	Cuatrimestrales ifNil: [ 
		Cuatrimestrales := OrderedCollection new
			                   add: self primerCuatrimestre;
			                   add: self segundoCuatrimestre;
			                   add: self tercerCuatrimestre;
			                   yourself ].
	^ Cuatrimestrales
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> diciembre [

	^ Tipos at: #diciembre
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> enero [

	^ Tipos at: #enero
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> febrero [

	^ Tipos at: #febrero
]

{ #category : #initialization }
MtPeriodo class >> initialize [

	Tipos := Dictionary new.
	Tipos
		at: #enero put: (self codigo: '01' descripcion: 'Enero');
		at: #febrero put: (self codigo: '02' descripcion: 'Febrero');
		at: #marzo put: (self codigo: '03' descripcion: 'Marzo');
		at: #abril put: (self codigo: '04' descripcion: 'Abril');
		at: #mayo put: (self codigo: '05' descripcion: 'Mayo');
		at: #junio put: (self codigo: '06' descripcion: 'Junio');
		at: #julio put: (self codigo: '07' descripcion: 'Julio');
		at: #agosto put: (self codigo: '08' descripcion: 'Agosto');
		at: #septiembre put: (self codigo: '09' descripcion: 'Septiembre');
		at: #octubre put: (self codigo: '10' descripcion: 'Octubre');
		at: #noviembre put: (self codigo: '11' descripcion: 'Noviembre');
		at: #diciembre put: (self codigo: '12' descripcion: 'Diciembre');
		at: #primerTrimestre
		put: (self codigo: '1T' descripcion: 'Primer trimestre');
		at: #segundoTrimestre
		put: (self codigo: '2T' descripcion: 'Segundo trimestre');
		at: #tercerTrimestre
		put: (self codigo: '3T' descripcion: 'Tercer trimestre');
		at: #cuartoTrimestre
		put: (self codigo: '4T' descripcion: 'Cuarto trimestre');
		at: #primerCuatrimestre
		put: (self codigo: '1P' descripcion: 'Primer cuatrimestre');
		at: #segundoCuatrimestre
		put: (self codigo: '2P' descripcion: 'Segundo cuatrimestre');
		at: #tercerCuatrimestre
		put: (self codigo: '3P' descripcion: 'Tercer cuatrimestre');
		at: #anual put: (self codigo: '0A' descripcion: 'Anual')
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> julio [

	^ Tipos at: #julio
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> junio [

	^ Tipos at: #junio
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> marzo [

	^ Tipos at: #marzo
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> mayo [

	^ Tipos at: #mayo
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> mensuales [

	"Devuelve una OrderedCollection con los periodos mensuales"

	Mensuales ifNil: [ Mensuales := OrderedCollection new add: self enero;
		  add: self febrero;
		  add: self marzo;
		  add: self abril;
		  add: self mayo;
		  add: self junio;
		  add: self julio;
		  add: self agosto;
		  add: self septiembre;
		  add: self octubre;
		  add: self noviembre;
		  add: self diciembre;
		  yourself ].
	^ Mensuales
		  
]

{ #category : #'instance creation' }
MtPeriodo class >> new [

	self error: 'MtPeriodo no permite crear nuevas instancias'
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> noviembre [

	^ Tipos at: #noviembre 
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> octubre [

	^ Tipos at: #octubre
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> primerCuatrimestre [

	^ Tipos at: #primerCuatrimestre
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> primerTrimestre [

	^ Tipos at: #primerTrimestre
]

{ #category : #initialization }
MtPeriodo class >> reset [

	Mensuales := nil.
	Trimestrales := nil.
	Cuatrimestrales := nil
	
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> segundoCuatrimestre [

	^ Tipos at: #segundoCuatrimestre
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> segundoTrimestre [

	^ Tipos at: #segundoTrimestre
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> septiembre [

	^ Tipos at: #septiembre
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> tercerCuatrimestre [

	^ Tipos at: #tercerCuatrimestre
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> tercerTrimestre [

	^ Tipos at: #tercerTrimestre
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> tipos [ 

	^ Tipos
]

{ #category : #'as yet unclassified' }
MtPeriodo class >> trimestrales [

	"Devuelve un OrderedCollection con los periodos trimestrales"

	Trimestrales ifNil: [ 
		Trimestrales := OrderedCollection new
			                add: self primerTrimestre;
			                add: self segundoTrimestre;
			                add: self tercerTrimestre;
									add: self cuartoTrimestre;
			                yourself ].
	^ Trimestrales
]

{ #category : #accessing }
MtPeriodo >> codigo [

	^ codigo
]

{ #category : #accessing }
MtPeriodo >> descripcion [

	^ descripcion
]

{ #category : #accessing }
MtPeriodo >> label [

	"Devuelve una cadena con el codigo y la descripcion separados por - "

	^ self asString
]

{ #category : #printing }
MtPeriodo >> printOn: aStream [

	"Append a sequence of characters to aStream that identify the receiver."

	aStream nextPutAll: codigo; nextPutAll: ' - '; nextPutAll: descripcion
]

{ #category : #'private - initialization' }
MtPeriodo >> setCodigo: aCodeString [

	"aCodeString es uno de los siguientes valores '01 02 .. 12 1T 2T 3T 1P 2P 3P 4P 0A'"
	codigo := aCodeString
]

{ #category : #'private - initialization' }
MtPeriodo >> setDescripcion: aString [

	descripcion := aString
]
