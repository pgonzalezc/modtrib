Class {
	#name : #MtViewComplementaria,
	#superclass : #MtViewBase,
	#instVars : [
		'complementaria',
		'sustitutiva',
		'rectificativa',
		'nroJustificanteAnterior'
	],
	#category : #'ModTrib-Common-Web'
}

{ #category : #'as yet unclassified' }
MtViewComplementaria >> conCheckboxRectificativa [

	config at: #admiteRectificativa put: true
]

{ #category : #'as yet unclassified' }
MtViewComplementaria >> conCheckboxSustitutiva [

	config at: #admiteSustitutiva put: true
]

{ #category : #'as yet unclassified' }
MtViewComplementaria >> defaultConfig [

	^ Dictionary new
		  at: #admiteSustitutiva put: false;
		  at: #admiteRectificativa put: false;
		  yourself
]

{ #category : #'as yet unclassified' }
MtViewComplementaria >> esValida [

	errores removeAll.
	(self hayMarcas and: [ nroJustificanteAnterior isEmpty ]) ifTrue: [ 
		errores add:
			'Debe introducir un número de justifiante. Es obligatorio' ].
	(self hayMarcas and: [ nroJustificanteAnterior size ~= 13 ]) ifTrue: [ 
		errores add:
			('Número de justificante anterior [{1}] invalido. Debe tener una longitud de 13 dígitos' 
				 format: { nroJustificanteAnterior }) ].
	(self hayMarcas not and: [ nroJustificanteAnterior isNotEmpty ]) 
		ifTrue: [ 
			errores add:
				'Si la declaración no es complementaria, ni sustitutiva ni rectificativa entonces no hay que informar del número de justificante' ].
	^ errores isEmpty
]

{ #category : #'as yet unclassified' }
MtViewComplementaria >> getTipo [

	complementaria ifTrue: [ ^ #complementaria ].
	sustitutiva ifTrue: [ ^ #sustitutiva ].
	rectificativa ifTrue: [ ^ #rectificativa ].
	^ #normal
]

{ #category : #'as yet unclassified' }
MtViewComplementaria >> hayMarcas [

	^ complementaria or: [ 
		  sustitutiva or: [ rectificativa  ] ]
]

{ #category : #initialization }
MtViewComplementaria >> initialize [

	super initialize.
	complementaria := false.
	sustitutiva := false.
	rectificativa := false.
	nroJustificanteAnterior := ''
]

{ #category : #'as yet unclassified' }
MtViewComplementaria >> modelValue [

		^ MtModelComplementaria
		  conTipo: self getTipo
		  yNroJustificanteAnterior: nroJustificanteAnterior
]

{ #category : #rendering }
MtViewComplementaria >> renderCheckboxComplementariaOn: html [

	html formCheckbox
		id: 'checkbox-complementaria';
		onChange: (html jQuery ajax
				 callback: [ :value | self toggleComplementaria ]
				 value: html jQuery this value;
				 script: [ :s | 
					 s << (html jQuery id: 'group-checkboxes') replaceWith: [ :r | 
							 self renderGroupCheckboxesOn: r ].
					 s << (html jQuery id: 'input-group-nro-justificante-anterior') 
						 replaceWith: [ :r | 
							 self renderInputNroJustificanteAnteriorOn: r ].
						self hayMarcas ifTrue: [ 
							 s
							 <<
								 (html jQuery id: 'input-nro-justificante-anterior')
									 triggerSelect ] ]);
		value: complementaria;	
		with: [ 
			html space.
			html label: 'Complementaria'.
			html space ]
]

{ #category : #rendering }
MtViewComplementaria >> renderCheckboxRectificativaOn: html [

	html formCheckbox
		id: 'checkbox-rectificativa';
		onChange: (html jQuery ajax
				 callback: [ :value | self toggleRectificativa ]
				 value: html jQuery this value;
				 script: [ :s | 
					 s << (html jQuery id: 'group-checkboxes') replaceWith: [ :r | 
							 self renderGroupCheckboxesOn: r ].
					 s << (html jQuery id: 'input-group-nro-justificante-anterior') 
						 replaceWith: [ :r | 
							 self renderInputNroJustificanteAnteriorOn: r ].
					 self hayMarcas ifTrue: [ 
							 s
							 <<
								 (html jQuery id: 'input-nro-justificante-anterior')
									 triggerSelect ] ]);
		value: rectificativa;
		with: [ 
			html space.
			html label: 'Rectificativa'.
			html space ]
]

{ #category : #rendering }
MtViewComplementaria >> renderCheckboxSustitutivaOn: html [

	html formCheckbox
		id: 'checkbox-sustitutiva';
		onChange: (html jQuery ajax
				 callback: [ :value | self toggleSustitutiva ]
				 value: html jQuery this value;
				 script: [ :s | 
					 s << (html jQuery id: 'group-checkboxes') replaceWith: [ :r | 
							 self renderGroupCheckboxesOn: r ].
					 s << (html jQuery id: 'input-group-nro-justificante-anterior') 
						 replaceWith: [ :r | 
							 self renderInputNroJustificanteAnteriorOn: r ].
					 self hayMarcas ifTrue: [ 
							 s << (html jQuery id: 'input-nro-justificante-anterior') triggerSelect ] ]);
		value: sustitutiva;
		with: [ 
			html space.
			html label: 'Sustitutiva'.
			html space ]
]

{ #category : #rendering }
MtViewComplementaria >> renderContentOn: html [

	html container: [ 
		html card: [ 
			html cardHeader: [ self renderHeaderOn: html ].
			html cardBody: [ 
				.
				html text:
					'Si esta autoliquidación es complementaria de otra autoliquidación anterior correspondiente al mismo concepto, ejercicio y período, indiquelo'.
				html break.
				html break.
				self renderGroupCheckboxesOn: html.
				html break.
				html text:
					'En este caso, consigne a continuación el número de justificante identificativo de la autoliquidación anterior'.
				html break.
				html break.
				self renderInputNroJustificanteAnteriorOn: html ] ].
		html space ]
]

{ #category : #rendering }
MtViewComplementaria >> renderGroupCheckboxesOn: html [

	html div
		id: 'group-checkboxes';
		with: [ 
			self renderCheckboxComplementariaOn: html.
			(config at: #admiteSustitutiva) ifTrue: [ 
					self renderCheckboxSustitutivaOn: html ].
			(config at: #admiteRectificativa) ifTrue: [ 
					self renderCheckboxRectificativaOn: html ] ]
]

{ #category : #rendering }
MtViewComplementaria >> renderHeaderOn: html [

	html heading
		level: 5;
		with: 'Complementaria'
]

{ #category : #rendering }
MtViewComplementaria >> renderInputNroJustificanteAnteriorOn: html [

	html row
		id: 'input-group-nro-justificante-anterior';
		with: [ 
			html
				column: [ 
					html label
						for: 'input-nro-justificante-anterior';
						with: 'Número de justificante' ]
				mediumSize: 3.
			html
				column: [ 
					html textInput
						formControl;
						id: 'input-nro-justificante-anterior';
						maxLength: 13;
						onChange: (html jQuery ajax
								 callback: [ :value | 
									 self log:
											 ('nro. justificante anterior: [{1}]' format: { value }).
									 self setNroJustificanteAnterior: value ]
								 value: html jQuery this value);
						disabled: self hayMarcas not;
						value: nroJustificanteAnterior;
						callback: [ :value | self setNroJustificanteAnterior: value ] ]
				mediumSize: 3 ]
]

{ #category : #initialization }
MtViewComplementaria >> setNroJustificanteAnterior: aString [

	nroJustificanteAnterior := aString
]

{ #category : #'as yet unclassified' }
MtViewComplementaria >> toggleComplementaria [

	complementaria := complementaria not.
	sustitutiva := false.
	rectificativa := false.
	self hayMarcas ifFalse: [ nroJustificanteAnterior := '' ]
]

{ #category : #'as yet unclassified' }
MtViewComplementaria >> toggleRectificativa [

	complementaria := false.
	sustitutiva := false.
	rectificativa := rectificativa not.
	self hayMarcas ifFalse: [ nroJustificanteAnterior := '' ]
]

{ #category : #'as yet unclassified' }
MtViewComplementaria >> toggleSustitutiva [

	complementaria := false.
	sustitutiva := sustitutiva not.
	rectificativa := false.
	self hayMarcas ifFalse: [ nroJustificanteAnterior := '' ]
]
