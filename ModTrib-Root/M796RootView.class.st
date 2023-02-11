Class {
	#name : #M796RootView,
	#superclass : #WAComponent,
	#instVars : [
		'children',
		'errores'
	],
	#category : #'ModTrib-Root-796'
}

{ #category : #testing }
M796RootView class >> canBeRoot [ 

	^ true
]

{ #category : #initialization }
M796RootView class >> initialize [

	WAAdmin register: self asApplicationAt: 'modelos/m796'
]

{ #category : #accessing }
M796RootView >> children [ 

	^ children
]

{ #category : #'as yet unclassified' }
M796RootView >> creaViewComplementaria [

	| view |
	view := MtViewComplementaria new.
	M796TipoDeclaracionSettings admiteSustitutiva ifTrue: [ 
		view conCheckboxSustitutiva ].
	M796TipoDeclaracionSettings admiteRectificativa ifTrue: [ 
		view conCheckboxRectificativa ].
	^ view
]

{ #category : #'as yet unclassified' }
M796RootView >> creaViewDevengo [

	| view |
	view := MtViewDevengo new.
	M796DevengoSettings admiteFechaInicio ifTrue: [ view conFechaInicio ].
	M796DevengoSettings admiteFechaFin ifTrue: [ view conFechaFin ].
	^ view
]

{ #category : #'as yet unclassified' }
M796RootView >> creaViewIngreso [

	| view |
	view := MtViewIngreso new.
	^ view
]

{ #category : #initialization }
M796RootView >> initialize [

	super initialize.
	errores := OrderedCollection new.
	children := OrderedCollection
		            with: MtViewIdentificacion new
		            with: self creaViewComplementaria
		            with: self creaViewDevengo
	"	            with: self creaViewIngreso"
	"	            with: M796LiquidacionComponent new"
]

{ #category : #'as yet unclassified' }
M796RootView >> procesar [

		children do: [ :each | 
		each esValida
			ifTrue: [ 
				Transcript
					show: each modelValue;
					cr ]
			ifFalse: [ errores addAll: each errores ] ]
]

{ #category : #rendering }
M796RootView >> renderContentOn: html [

	html form: [ 
		errores isNotEmpty ifTrue: [ self renderErroresOn: html ].
		children do: [ :each | html render: each ].
		html container
			style: 'text-align: right';
			with: [ 
				html formButton
					bePrimary;
					callback: [ self procesar ];
					value: 'Ok' ] ]	
]

{ #category : #rendering }
M796RootView >> renderErroresOn: html [

	html alert
		beWarning;
		with: [ 
			errores do: [ :each | 
					each class = MtUiError
						ifFalse: [ html text: each ]
						ifTrue: [ each renderErrorOn: html ].
					html break ] ].
	errores removeAll
]

{ #category : #rendering }
M796RootView >> rendererClass [ 
	
	^ SBSHtmlCanvas 
]

{ #category : #updating }
M796RootView >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot stylesheet url:
		'/static-files/css/bootstrap-v5.0.2/bootstrap.min.css'.
	aHtmlRoot javascript url: '/static-files/js/jquery.min.js'
]
