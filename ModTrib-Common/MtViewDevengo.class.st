Class {
	#name : #MtViewDevengo,
	#superclass : #MtViewBase,
	#instVars : [
		'ejercicio',
		'periodo',
		'fechaInicio',
		'fechaFin'
	],
	#category : #'ModTrib-Common-Web'
}

{ #category : #'as yet unclassified' }
MtViewDevengo >> conFechaFin [

	config at: #admiteFechaFin put: true
]

{ #category : #'as yet unclassified' }
MtViewDevengo >> conFechaInicio [

	config at: #admiteFechaInicio put: true
]

{ #category : #'as yet unclassified' }
MtViewDevengo >> defaultConfig [

	^ Dictionary new
		at: #admiteFechaInicio put: false;
		at: #admiteFechaFin put: false;
		yourself
]

{ #category : #checking }
MtViewDevengo >> esValida [

	self validaEjercicio.
	(config at: #admiteFechaInicio) ifTrue: [ self validaFechaInicio ].
	^ errores isEmpty
]

{ #category : #'as yet unclassified' }
MtViewDevengo >> fechaFin [

	fechaFin ifNil: [ ^ nil ].
	^ DateAndTime fromString: fechaFin
]

{ #category : #'as yet unclassified' }
MtViewDevengo >> fechaInicio [ 
	
	fechaInicio ifNil: [ ^ nil ].
	^ DateAndTime fromString: fechaInicio
]

{ #category : #'as yet unclassified' }
MtViewDevengo >> modelValue [

	^ MtModelDevengo new
		  setEjercicio: ejercicio asInteger;
		  setFechaInicio: self fechaInicio;
		  setFechaFin: self fechaFin
]

{ #category : #rendering }
MtViewDevengo >> renderContentOn: html [

	html container: [ 
		html card: [ 
			html cardHeader: [ self renderHeaderOn: html ].
			html cardBody: [ 
				html row: [ 
					html column: [ self renderInputEjercicioOn: html ] mediumSize: 2.
					self tienePeriodoImpositivo ifTrue: [ 
						html strong: 'Periodo impositivo'.
						(config at: #admiteFechaInicio) ifTrue: [ 
							html
								column: [ self renderInputFechaInicioOn: html ]
								mediumSize: 3 ].
						(config at: #admiteFechaFin) ifTrue: [ 
							html column: [ self renderInputFechaFinOn: html ] mediumSize: 3 ] ] ] ] ].
		html space ]
]

{ #category : #rendering }
MtViewDevengo >> renderHeaderOn: html [

	html heading
		level5;
		with: 'Devengo'
]

{ #category : #rendering }
MtViewDevengo >> renderInputEjercicioOn: html [

	html formGroup: [ 
		html label
			for: 'input-ejercicio';
			with: 'Ejercicio'.
		html textInput
			formControl;
			id: 'input-ejercicio';
			maxLength: 4;
			value: ejercicio;
			callback: [ :value | self setEjercicio: value ] ]
]

{ #category : #rendering }
MtViewDevengo >> renderInputFechaFinOn: html [

	html formGroup: [ 
		html label
			for: 'input-fecha-fin';
			with: 'Fecha fin'.
		html textInput
			formControl;
			id: 'input-fecha-fin';
			name: 'input-fecha-fin';
			type: 'date';
			value: fechaFin;
			callback: [ :value | self setFechaFin: value ] ]
]

{ #category : #rendering }
MtViewDevengo >> renderInputFechaInicioOn: html [

	html formGroup: [ 
		html label
			for: 'input-fecha-inicio';
			with: 'Fecha inicio'.
		html textInput
			formControl;
			id: 'input-fecha-inicio';
			name: 'input-fecha-inicio';
			type: 'date';
			value: fechaInicio;
			callback: [ :value | self setFechaInicio: value ] ]
]

{ #category : #initialization }
MtViewDevengo >> setEjercicio: aString [

	ejercicio := aString
]

{ #category : #initialization }
MtViewDevengo >> setFechaFin: aString [

	fechaFin := aString
]

{ #category : #initialization }
MtViewDevengo >> setFechaInicio: aString [

	fechaInicio := aString
]

{ #category : #initialization }
MtViewDevengo >> setPeriodo: unPeriodo [

	periodo := unPeriodo
]

{ #category : #'as yet unclassified' }
MtViewDevengo >> tienePeriodoImpositivo [

	^ (config at: #admiteFechaInicio) or: [ config at: #admiteFechaFin ]
]

{ #category : #'as yet unclassified' }
MtViewDevengo >> validaEjercicio [

	('\d{4}' asRegex matches: ejercicio) ifFalse: [ 
		errores add: (MtUiError
				 enItem: 'input-ejercicio'
				 descripcion:
				 ('El valor [{1}] del ejercicio es incorrecto' format:
					  { ejercicio })) ]
]

{ #category : #'as yet unclassified' }
MtViewDevengo >> validaFechaInicio [

	(config at: #admiteFechaFin) ifTrue: [ 
		fechaInicio ifEmpty: [ 
			errores add: (MtUiError
					 enItem: 'input-fecha-inicio'
					 descripcion: 'La fecha de inicio no puede estar vacia').
			^ self ].
		fechaFin ifEmpty: [ 
			errores add: (MtUiError
					 enItem: 'input-fecha-fin'
					 descripcion: 'La fecha de fin no puede estar vacía').
			^ self ].
		self fechaInicio < self fechaFin ifFalse: [ 
			errores add: (MtUiError
					 enItem: 'input-fecha-inicio'
					 descripcion:
					 'La fecha de inicio del periodo impositivo debe ser menor que la fecha de fin') ] ]
]
