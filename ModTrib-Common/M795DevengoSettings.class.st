Class {
	#name : #M795DevengoSettings,
	#superclass : #MtDevengoSettings,
	#category : #'ModTrib-Common-Settings'
}

{ #category : #'as yet unclassified' }
M795DevengoSettings class >> settingsOn: aBuilder at: aParent [

	(aBuilder group: #m795Devengo)
		label: 'Devengo' translated;
		description: 'Permite configurar las opciones de devengo del modelo';
		parent: aParent;
		with: [ 
			self settingsOn: aBuilder.
			(aBuilder group: #m795Periodos)
				label: 'Periodos' translated;
				description:
					'Permite seleccionar los periodos de devengo del modelo';
				with: [ self settingsPeriodosOn: aBuilder ] ]
]
