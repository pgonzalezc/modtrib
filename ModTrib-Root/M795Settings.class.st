Class {
	#name : #M795Settings,
	#superclass : #Object,
	#instVars : [
		'admiteSustitutiva',
		'admiteRectificativa',
		'admiteFechaInicio',
		'admiteFechaFin'
	],
	#classVars : [
		'Current'
	],
	#category : #'ModTrib-Root-795'
}

{ #category : #accessing }
M795Settings class >> current [

	Current ifNil: [ Current := self basicNew initialize ].
	^ Current
]

{ #category : #'as yet unclassified' }
M795Settings class >> devengoSettingsOn: aBuilder [

	M795DevengoSettings settingsOn: aBuilder at: #m795
]

{ #category : #settings }
M795Settings class >> settingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #m795)
		label: 'Modelo 795' translated;
		description: 'Modelo 795';
		parent: #modelostributarios;
		noOrdering.
	self devengoSettingsOn: aBuilder.
		self tipoDeclaracionSettingsOn: aBuilder.
	self tipoLiquidacionIngresoSettingsOn: aBuilder.

]

{ #category : #'as yet unclassified' }
M795Settings class >> tipoDeclaracionSettingsOn: aBuilder [

	M795TipoDeclaracionSettings settingsOn: aBuilder at: #m795
]

{ #category : #'as yet unclassified' }
M795Settings class >> tipoLiquidacionIngresoSettingsOn: aBuilder [

	M795TipoLiquidacionSettings settingsOn: aBuilder at: #m795
]
