Class {
	#name : #BaselineOfModTrib,
	#superclass : #BaselineOf,
	#category : #BaselineOfModTrib
}

{ #category : #'as yet unclassified' }
BaselineOfModTrib >> BaselineOf: spec [

	<baseline>
	spec for: #common do: [ 
		self bootstrap5: spec.
		self p3: spec.
		spec
			package: 'ModTrib-Common'
			with: [ spec requires: #( 'Boottrap5' 'P3' ) ].
		spec package: 'ModTrib-Common-Tests'.
		spec package: 'ModTrib-Root' ].
	spec
		group: 'Core' with: #( 'ModTrib-Common' 'ModTrib-Root' );
		group: 'Tests' with: #( 'ModTrib-Common-Tests' );
		group: 'default' with: #( 'Core' 'Tests' )
]

{ #category : #'as yet unclassified' }
BaselineOfModTrib >> bootstrap5: spec [

	spec baseline: 'Bootstrap5' with: [ 
		spec
			loads: #( 'default' );
			repository: 'github://astares/Seaside-Bootstrap5:master/src' ]
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
