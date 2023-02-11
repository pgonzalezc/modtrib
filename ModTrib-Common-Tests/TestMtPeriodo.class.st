Class {
	#name : #TestMtPeriodo,
	#superclass : #TestCase,
	#category : #'ModTrib-Common-Tests-Web'
}

{ #category : #tests }
TestMtPeriodo >> testAnual [

	self assert: MtPeriodo anual codigo equals: '0A'.
	self assert: MtPeriodo anual descripcion equals: 'Anual'.
	self assert: MtPeriodo anual label equals: '0A - Anual'
]

{ #category : #tests }
TestMtPeriodo >> testCuatrimestrales [

	self assert: MtPeriodo cuatrimestrales size equals: 3.
	self
		assert: MtPeriodo cuatrimestrales first
		equals: MtPeriodo primerCuatrimestre.
	self
		assert: MtPeriodo cuatrimestrales second
		equals: MtPeriodo segundoCuatrimestre.
	self
		assert: MtPeriodo cuatrimestrales third
		equals: MtPeriodo tercerCuatrimestre.
	self assert: MtPeriodo cuatrimestrales first codigo equals: '1P'.
	self assert: MtPeriodo cuatrimestrales second codigo equals: '2P'.
	self assert: MtPeriodo cuatrimestrales third codigo equals: '3P'
]

{ #category : #tests }
TestMtPeriodo >> testPeriodoDiciembre [

	self assert: MtPeriodo diciembre codigo equals: '12'.
	self assert: MtPeriodo diciembre descripcion equals: 'Diciembre'.
	self assert: MtPeriodo diciembre label equals: '12 - Diciembre'
]

{ #category : #tests }
TestMtPeriodo >> testPeriodoEnero [

	self assert: MtPeriodo enero codigo equals: '01'.
	self assert: MtPeriodo enero descripcion equals: 'Enero'.
	self assert: MtPeriodo enero label equals: '01 - Enero'
]

{ #category : #tests }
TestMtPeriodo >> testPrimerTrimestre [

	self assert: MtPeriodo primerTrimestre codigo equals: '1T'.
	self assert: MtPeriodo primerTrimestre descripcion equals: 'Primer trimestre'.
	self assert: MtPeriodo primerTrimestre label equals: '1T - Primer trimestre'
]

{ #category : #tests }
TestMtPeriodo >> testPrimercuatrimestre [

	self assert: MtPeriodo primerCuatrimestre codigo equals: '1P'.
	self
		assert: MtPeriodo primerCuatrimestre descripcion
		equals: 'Primer cuatrimestre'.
	self
		assert: MtPeriodo primerCuatrimestre label
		equals: '1P - Primer cuatrimestre'
]

{ #category : #tests }
TestMtPeriodo >> testTrimestrales [

	self assert: MtPeriodo trimestrales size equals: 4.
	self
		assert: MtPeriodo trimestrales first
		equals: MtPeriodo primerTrimestre.
	self
		assert: MtPeriodo trimestrales second
		equals: MtPeriodo segundoTrimestre.
	self
		assert: MtPeriodo trimestrales third
		equals: MtPeriodo tercerTrimestre.
	self
		assert: MtPeriodo trimestrales fourth
		equals: MtPeriodo cuartoTrimestre.
	self assert: MtPeriodo trimestrales first codigo equals: '1T'.
	self assert: MtPeriodo trimestrales second codigo equals: '2T'.
	self assert: MtPeriodo trimestrales third codigo equals: '3T'.
	self assert: MtPeriodo trimestrales fourth codigo equals: '4T'
]
