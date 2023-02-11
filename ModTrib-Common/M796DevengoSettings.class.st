Class {
	#name : #M796DevengoSettings,
	#superclass : #MtDevengoSettings,
	#category : #'ModTrib-Common-Settings'
}

{ #category : #'as yet unclassified' }
M796DevengoSettings class >> settingsOn: aBuilder at: aParent [

	(aBuilder group: #m796Devengo)
		label: 'Devengo' translated;
		description: 'Permite configurar las opciones de devengo del modelo';
		parent: aParent;
		with: [ 
			self settingsOn: aBuilder.
			(aBuilder group: #m796Periodos)
				label: 'Periodos' translated;
				description:
					'Permite selecciona los periodos de devengo del modelo';
				with: [ self settingsPeriodosOn: aBuilder ] ]
]
