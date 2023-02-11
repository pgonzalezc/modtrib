Class {
	#name : #M796Settings,
	#superclass : #Object,
	#category : #'ModTrib-Root-796'
}

{ #category : #'as yet unclassified' }
M796Settings class >> devengoSettingsOn: aBuilder [

	M796DevengoSettings settingsOn: aBuilder at: #m796
]

{ #category : #settings }
M796Settings class >> settingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #modelostributarios)
		label: 'Modelos tributarios' translated;
		description: 'Configuración de los modelos tributarios'.
	(aBuilder group: #m796)
		label: 'Modelo 796';
		description:
			'Configuración del modelo 796. Gravamen temporal energético';
		parent: #modelostributarios;
		noOrdering.
	self devengoSettingsOn: aBuilder.
	self tiposDeclaracionSettingsOn: aBuilder.
	self tiposLiquidacionSettingsOn: aBuilder
]

{ #category : #'as yet unclassified' }
M796Settings class >> tiposDeclaracionSettingsOn: aBuilder [

	M796TipoDeclaracionSettings settingsOn: aBuilder at: #m796
]

{ #category : #'as yet unclassified' }
M796Settings class >> tiposLiquidacionSettingsOn: aBuilder [

	M796TipoLiquidacionSettings settingsOn: aBuilder at: #m796
]
