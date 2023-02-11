Class {
	#name : #BaselineOfModTrib,
	#superclass : #BaselineOf,
	#category : #BaselineOfModTrib
}

{ #category : #'as yet unclassified' }
BaselineOfModTrib >> BaselineOf: spec [

	<baseline>
	spec for: #common do: [ 
		self seaside: spec.
		self p3: spec.
		spec
			package: 'ModTrib-Common'
			with: [ spec requires: #( 'Seaside3' 'P3' ) ].
		spec package: 'ModTrib-Common-Test'.
		spec package: 'ModTrib-Root' ].
	spec
		group: 'Core' with: #( 'ModTrib-Common' 'ModTrib-Root' );
		group: 'Tests' with: #( 'ModTrib-Common-Tests' );
		group: 'default' with: #( 'Core' 'Test' )
]

{ #category : #'as yet unclassified' }
BaselineOfModTrib >> p3: spec [

	spec baseline: 'P3' with: [ 
		spec
			loads: #( 'default' );
			repository: 'github://svenvc/P3:master/repository' ]
]

{ #category : #baselines }
BaselineOfModTrib >> seaside: spec [

	spec baseline: 'Seaside3' with: [ 
		spec
			loads: #( 'default' );
			repository: 'github://SeasideSt/Seaside:master/repository' ]
]
