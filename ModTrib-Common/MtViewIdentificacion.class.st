Class {
	#name : #MtViewIdentificacion,
	#superclass : #MtViewBase,
	#instVars : [
		'nif',
		'apellidos',
		'nombre',
		'telefono',
		'personaDeContacto',
		'regimenConsolidacionFiscal',
		'grupoMercantil',
		'nroDeGrupo'
	],
	#category : #'ModTrib-Common-Web'
}

{ #category : #'as yet unclassified' }
MtViewIdentificacion >> defaultConfig [ 

	^ Dictionary new
]

{ #category : #'as yet unclassified' }
MtViewIdentificacion >> esNifJuridica [

	Transcript show: nif; cr.
	^ 'AB' anySatisfy: [ :letter | letter = (nif at: 1) uppercase ]
]

{ #category : #checking }
MtViewIdentificacion >> esValida [

	self validaNif.
	self validaApellidos.
	self validaNombre.
	self validaTelefono.
	^ errores isEmpty
]

{ #category : #checking }
MtViewIdentificacion >> hayMarcasDeGrupo [

	^ (regimenConsolidacionFiscal or: [grupoMercantil ])
]

{ #category : #initialization }
MtViewIdentificacion >> initialize [

	super initialize.
	regimenConsolidacionFiscal := false.
	grupoMercantil := false.
]

{ #category : #'as yet unclassified' }
MtViewIdentificacion >> modelValue [

	| tipoGrupo |
	grupoMercantil ifTrue: [ tipoGrupo := MtTiposGrupo regimenMercantil ].
	regimenConsolidacionFiscal ifTrue: [ 
		tipoGrupo := MtTiposGrupo regimenConsolidacionFiscal ].
	^ MtModelIdentificacion new
		  setNif: nif;
		  setApellidos: apellidos;
		  setNombre: nombre;
		  setTelefono: telefono;
		  setPersonaDeContacto: personaDeContacto;
		  setTipoGrupo: tipoGrupo;
		  setNroDeGrupo: nroDeGrupo
]

{ #category : #rendering }
MtViewIdentificacion >> renderCheckboxGrupoConsolidacionFiscalOn: html [

	html formGroup formCheck with: [ 
		html formCheckLabel: [ 
			html formCheckbox
				onChange: (html jQuery ajax
						 callback: [ :value | self toggleGrupoConsolidacionFiscal ]
						 value: html jQuery this value;
						 script: [ :s | 
							 s << (html jQuery id: 'row-2') replaceWith: [ :r | 
									 self renderRow2On: html ].
							 s << (html jQuery id: 'input-nro-de-grupo') triggerSelect ]);
				value: regimenConsolidacionFiscal;
				with: 'Grupo fiscal. Regimen de consolidación fiscal IS' ] ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderCheckboxGrupoMercantilOn: html [

	html formGroup
		formCheck;
		with: [ 
			html formCheckLabel: [ 
					html formCheckbox
						id: 'checkbox-grupo-mercantil';
						value: grupoMercantil;
						onChange: (html jQuery ajax
								 callback: [ :value | self toggleGrupoMercantil ]
								 value: html jQuery this value;
								 script: [ :s | 
									 s << (html jQuery id: 'row-2') replaceWith: [ :r | 
											 self renderRow2On: r ].
									 s << (html jQuery id: 'input-nro-de-grupo') triggerSelect ]);
						with: 'Grupo mercantil IS' ] ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderContentOn: html [

	html container: [ 
		html card: [ 
			html cardHeader: [ self renderHeaderOn: html ].
			html cardBody: [ 
				self renderRow1PersonaFisicaOn: html.
				self renderRow2On: html.
				self renderRow3On: html ] ].
		html space ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderHeaderOn: html [

	html heading
		level: 5;
		with: 'Identificación'
]

{ #category : #rendering }
MtViewIdentificacion >> renderInputtextGroupApellidos: html [

	html formGroup
		id: 'group-input-apellidos';
		with: [ 
			html label
				for: 'input-apellidos';
				with: 'Apellidos'.
			html textInput formControl
				id: 'input-apellidos';
				value: apellidos;
				callback: [ :value | self setApellidos: value ] ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderInputtextGroupNifOn: html [

	html formGroup
		id: 'group-input-nif';
		with: [ 
			html label
				for: 'input-nif';
				with: 'NIF'.
			html textInput formControl
				id: 'input-nif';
				maxLength: 9;
				onChange: (html jQuery ajax
						 callback: [ :value | self setNif: value ]
						 value: html jQuery this value;
						 script: [ :s | 
							 self esNifJuridica
								 ifTrue: [ 
									 s << (html jQuery id: 'row1') replaceWith: [ :r | 
											 self renderRow1PersonaJuridicaOn: r ].
									 s << (html jQuery id: 'input-razon-social') triggerFocus ]
								 ifFalse: [ 
									 s << (html jQuery id: 'row1') replaceWith: [ 
											 self renderRow1PersonaFisicaOn: html ].
									 s << (html jQuery id: 'input-apellidos') triggerSelect ] ]);
				value: nif;
				callback: [ :value | self setNif: value ] ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderInputtextGroupNombreOn: html [

	html formGroup
		id: 'group-input-nombre';
		with: [ 
			html label
				for: 'input-nombre';
				with: 'Nombre'.
			html textInput formControl
				id: 'input-nombre';
				value: nombre;
				callback: [ :value| self setNombre: value ]  ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderInputtextGroupPersonaDeContactoOn: html [

	html formGroup
		id: 'group-input-persona-de-contacto';
		with: [ 
			html label
				for: 'input-persona-de-contacto';
				with: 'Persona de contacto'.
			html textInput
				formControl;
				id: 'input-persona-de-contacto';
				value: personaDeContacto ;
				callback: [ :value | self setPersonaDeContacto: value ] ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderInputtextGroupRazonSocialOn: html [

	html formGroup
		id: 'group-razon-social';
		with: [ 
			html label
				for: 'input-razon-social';
				with: 'Razón social'.
			html textInput
				formControl;
				id: 'input-razon-social' ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderInputtextGroupTelefonoOn: html [

	html formGroup
		id: 'group-input-telefono';
		with: [ 
			html label
				for: 'input-telefono';
				with: 'Teléfono'.
			html textInput
				formControl;
				id: 'input-telefono';
				value: telefono;
				callback: [ :value | self setTelefono: value ] ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderInputtextNroDeGrupoOn: html [

	html formGroup
		id: 'group-input-nro-de-grupo';
		with: [ 
			html label
				for: 'input-nro-de-grupo';
				with: 'Número de grupo'.
			html textInput
				formControl;
				id: 'input-nro-de-grupo';
				disabled: self hayMarcasDeGrupo not;	
				value: nroDeGrupo;
				callback: [ :value | self setNroDeGrupo: value ] ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderRow1PersonaFisicaOn: html [

	html row id: 'row1'; with: [ 
		html column: [ self renderInputtextGroupNifOn: html ] mediumSize: 2.
		html
			column: [ self renderInputtextGroupApellidos: html ]
			mediumSize: 7.
		html column: [ self renderInputtextGroupNombreOn: html ] mediumSize: 3 ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderRow1PersonaJuridicaOn: html [

	html row
		id: 'row1';
		with: [ 
			html column: [ self renderInputtextGroupNifOn: html ] mediumSize: 2.
			html
				column: [ self renderInputtextGroupRazonSocialOn: html ]
				mediumSize: 10 ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderRow2On: html [

	html row id: 'row-2'; with: [ 
		html
			column: [ self renderCheckboxGrupoConsolidacionFiscalOn: html ]
			mediumSize: 5.
		html
			column: [ self renderCheckboxGrupoMercantilOn: html ]
			mediumSize: 3.
		html
			column: [ self renderInputtextNroDeGrupoOn: html ]
			mediumSize: 4 ]
]

{ #category : #rendering }
MtViewIdentificacion >> renderRow3On: html [

	html row: [ html strong: 'Persona con la que relacionarse' ].
	html row: [ html column: [ self renderInputtextGroupTelefonoOn: html ] mediumSize: 4.
		html column: [ self renderInputtextGroupPersonaDeContactoOn: html ] mediumSize: 8 ]
]

{ #category : #initialization }
MtViewIdentificacion >> setApellidos: unaCadena [

	apellidos := unaCadena
]

{ #category : #initialization }
MtViewIdentificacion >> setNif: unNif [

	nif := unNif
]

{ #category : #initialization }
MtViewIdentificacion >> setNombre: unaCadena [

	nombre := unaCadena
]

{ #category : #initialization }
MtViewIdentificacion >> setNroDeGrupo: unNroDeGrupo [

	nroDeGrupo := unNroDeGrupo
]

{ #category : #initialization }
MtViewIdentificacion >> setPersonaDeContacto: unaCadena [

	personaDeContacto := unaCadena
]

{ #category : #initialization }
MtViewIdentificacion >> setTelefono: aTelephonNumber [

	telefono := aTelephonNumber
]

{ #category : #action }
MtViewIdentificacion >> toggleGrupoConsolidacionFiscal [

	regimenConsolidacionFiscal := regimenConsolidacionFiscal not.
	grupoMercantil := false.
]

{ #category : #action }
MtViewIdentificacion >> toggleGrupoMercantil [

	regimenConsolidacionFiscal := false.
	grupoMercantil := grupoMercantil not
]

{ #category : #validating }
MtViewIdentificacion >> validaApellidos [

	apellidos ifEmpty: [ 
		errores add: (MtUiError
				 enItem: 'input-apellidos'
				 descripcion: 'Apellidos no informado. Es obligatorio') ]
]

{ #category : #validating }
MtViewIdentificacion >> validaNif [

	nif ifEmpty: [ 
		errores add: (MtUiError
				 enItem: 'input-nif'
				 descripcion: 'Nif no informado. Es obligatorio') ].
	nif size ~= 9 ifTrue: [ 
		errores add: (MtUiError
				 enItem: 'input-nif'
				 descripcion:
				 ('Longitud [{1}] del Nif incorrecta' format: { nif })) ]
]

{ #category : #validating }
MtViewIdentificacion >> validaNombre [

	nombre ifEmpty: [ 
		errores add: (MtUiError
				 enItem: 'input-nombre'
				 descripcion: 'Nombre no informado. Es obligatorio') ]
]

{ #category : #validating }
MtViewIdentificacion >> validaTelefono [

	(telefono isNotEmpty and: [ telefono size ~= 9 ])
		ifTrue: [ 
			errores add: (MtUiError
					 enItem: 'input-telefono'
					 descripcion:
					 ('Teléfono [{1}] con longitud incorrecta' format: { telefono })) ]
		ifFalse: [ 
			(telefono isEmpty and: [ personaDeContacto isNotEmpty ]) ifTrue: [ 
				errores add: (MtUiError
						 enItem: 'input-telefono'
						 descripcion:
						 'Teléfono debe informarse si se ha informado persona de contacto') ].
			(personaDeContacto isEmpty and: [ telefono isNotEmpty ]) ifTrue: [ 
				errores add: (MtUiError
						 enItem: 'input-persona-de-contacto'
						 descripcion:
						 'Persona de contacto debe informarse si se ha informado teléfono') ] ]
]
