Class {
	#name : #MtViewBase,
	#superclass : #WAComponent,
	#instVars : [
		'config',
		'errores'
	],
	#category : #'ModTrib-Common-Web'
}

{ #category : #'as yet unclassified' }
MtViewBase >> defaultConfig [

	self subclassResponsibility 
]

{ #category : #accessing }
MtViewBase >> errores [

	| errs |
	errs := errores copy.
	errores removeAll.
	^ errs
]

{ #category : #checking }
MtViewBase >> esValida [ 
	
	self subclassResponsibility 
]

{ #category : #initialization }
MtViewBase >> initialize [

	super initialize.
	config := self defaultConfig.
	errores := OrderedCollection new
]

{ #category : #logging }
MtViewBase >> log: aString [

	Transcript show: aString; cr
]

{ #category : #'as yet unclassified' }
MtViewBase >> modelValue [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
MtViewBase >> rendererClass [

	^ SBSHtmlCanvas
]

{ #category : #updating }
MtViewBase >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5
]
