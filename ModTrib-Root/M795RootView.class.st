Class {
	#name : #M795RootView,
	#superclass : #WAComponent,
	#instVars : [
		'children',
		'errores'
	],
	#category : #'ModTrib-Root-795'
}

{ #category : #testing }
M795RootView class >> canBeRoot [ 

	^ true
]

{ #category : #initialization }
M795RootView class >> initialize [

	<script>
	WAAdmin register: self asApplicationAt: 'modelos/m795'
]

{ #category : #'as yet unclassified' }
M795RootView >> creaViewDevengo [ 

	| view |
	view := MtViewDevengo new.
	M795DevengoSettings admiteFechaInicio ifTrue: [ view conFechaInicio  ].
	M795DevengoSettings admiteFechaFin ifTrue: [ view conFechaFin  ].
	^ view
]

{ #category : #initialization }
M795RootView >> initialize [ 

	super initialize.
	children := OrderedCollection 
		with: self creaViewDevengo 
]

{ #category : #'as yet unclassified' }
M795RootView >> procesar [

	children do: [ :each | 
		each esValida
			ifTrue: [ 
				Transcript
					show: each modelValue;
					cr ]
			ifFalse: [ errores addAll: each errores ] ]
]

{ #category : #rendering }
M795RootView >> renderContentOn: html [

	html form: [ children do: [ :each | html render: each ].
		html container
			style: 'text-align: right';
			with: [ 
				html formButton
					bePrimary;
					callback: [ self procesar ];
					value: 'Ok' ] ]
]

{ #category : #rendering }
M795RootView >> rendererClass [

	^ SBSHtmlCanvas
]

{ #category : #updating }
M795RootView >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot stylesheet url:
		'/static-files/css/bootstrap-v5.0.2/bootstrap.min.css'.
	aHtmlRoot javascript url: '/static-files/js/jquery.min.js'
]
