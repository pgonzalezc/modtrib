Class {
	#name : #M796LiquidacionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'liquidacion'
	],
	#category : #'ModTrib-Root-796'
}

{ #category : #'as yet unclassified' }
M796LiquidacionComponent >> bloqueIIUpdaterOn: html [

	^ [ :s | 
	  s << (html jQuery id: 'campos-bloque-ii') replaceWith: [ :r | 
		  self renderCamposBloqueIIOn: r ].
	s << (html jQuery id: 'campos-bloque-ii') replaceWith: [ :r | 
		  self renderCamposResultadoOn: r ] ]
]

{ #category : #'as yet unclassified' }
M796LiquidacionComponent >> bloqueIUpdaterOn: html [

	^ [ :s | 
	  s << (html jQuery id: 'campos-bloque-i') replaceWith: [ :r | 
		  self renderCamposBloqueIOn: r ].
	  s << (html jQuery id: 'campos-bloque-ii') replaceWith: [ :r | 
		  self renderCamposBloqueIIOn:  r ].
	s << (html jQuery id: 'campos-resultado') replaceWith: [ :r | 
		  self renderCamposResultadoOn:  r ] ]
]

{ #category : #'as yet unclassified' }
M796LiquidacionComponent >> goto: unaPartida on: html [

	^ (html jQuery id: ('p{01}-input' format: { unaPartida }))
		  triggerSelect
]

{ #category : #initialization }
M796LiquidacionComponent >> initialize [ 

	super initialize.
	liquidacion := M796LiquidacionModel new.
]

{ #category : #rendering }
M796LiquidacionComponent >> renderBloqueIIOn: html [

	html container: [  
	html heading
		level: 4;
		with: [ html strong: 'II. Total liquidacion' ].
	self renderCamposBloqueIIOn: html]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderBloqueIOn: html [

	html container
		with: [ 
			html heading
				level: 4;
				with: [ 
					html strong: 'I. Prestación patrimonial. Gravamen temporal' ].
			self renderCamposBloqueIOn: html ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderCamposBloqueIIOn: html [

	html div
		id: 'campos-bloque-ii';
		with: [ 
			html row: [ self renderRowP06On: html ].
			html row: [ self renderRowP07On: html ] ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderCamposBloqueIOn: html [

	html div
		id: 'campos-bloque-i';
		with: [ 
			html row: [ self renderRowP01On: html ].
			html row: [ self renderRowP02On: html ].
			html row: [ self renderRowP03On: html ].
			html row: [ self renderRowP04On: html ].
			html row: [ self renderRowP05On: html ] ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderCamposResultadoOn: html [

	html div
		id: 'campos-resultado';
		with: [ 
			html row: [ self renderRowP08On: html ].
			html row: [ self renderRowP09On: html ].
			 html row: [ self renderRowP10On: html ]]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderContentOn: html [

	self renderHeaderOn: html.
	self renderBloqueIOn: html.
	self renderBloqueIIOn: html.
	self renderResultadoOn: html.
]

{ #category : #rendering }
M796LiquidacionComponent >> renderHeaderOn: html [

	html heading level: 2; with: [ html strong: 'Liquidación' ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputGroupP01On: html [

	html inputGroup: [ 
		html inputGroupPrepend: [ 
			html inputGroupText: [ html strong: '[01]' ] ].
		self renderInputP01On: html ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputGroupP02On: html [

	html inputGroup: [ 
		html inputGroupPrepend: [ 
			html inputGroupText: [ html strong: '[02]' ] ].
		self renderInputP02On: html ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputGroupP03On: html [

	html inputGroup: [ 
		html inputGroupPrepend: [ 
			html inputGroupText: [ html strong: '[03]' ] ].
		self renderInputP03On: html ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputGroupP04On: html [

	html inputGroup: [ 
		html inputGroupPrepend: [ 
			html inputGroupText: [ html strong: '[04]' ] ].
		self renderInputP04On: html.
		html inputGroupAppend: [ html inputGroupText: '%' ] ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputGroupP05On: html [

	html inputGroup: [ 
		html inputGroupPrepend: [ 
			html inputGroupText: [ html strong: '[05]' ] ].
		self renderInputP05On: html ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputGroupP06On: html [

	html inputGroup: [ 
		html inputGroupPrepend: [ 
			html inputGroupText: [ html strong: '[06]' ] ].
		self renderInputP06On: html ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputGroupP07On: html [

	html inputGroup: [ 
		html inputGroupPrepend: [ 
			html inputGroupText: [ html strong: '[07]' ] ].
		self renderInputP07On: html.
		html inputGroupAppend: [ html inputGroupText: '%' ] ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputGroupP08On: html [

	html inputGroup: [ 
		html inputGroupPrepend: [ 
			html inputGroupText: [ html strong: '[08]' ] ].
		self renderInputP08On: html ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputGroupP09On: html [

	html inputGroup: [ 
		html inputGroupPrepend: [ 
			html inputGroupText: [ html strong: '[09]' ] ].
		self renderInputP09On: html ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputGroupP10On: html [

	html inputGroup: [ 
		html inputGroupPrepend: [ 
			html inputGroupText: [ html strong: '[10]' ] ].
		self renderInputP10On: html ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputP01On: html [

	html textInput
		formControl;
		id: 'p01-input';
		onChange: (html jQuery ajax
				 onComplete: (self goto: '02' on: html);
				 callback: [ :value | liquidacion p01: value asNumber ]
				 value: html jQuery this value;
				 script: (self bloqueIUpdaterOn: html));
		value: liquidacion p01
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputP02On: html [

	html textInput
		formControl;
		id: 'p02-input';
		onChange: (html jQuery ajax
				 onComplete: (self goto: '04' on: html);
				 callback: [ :value | liquidacion p02: value asNumber ]
				 value: html jQuery this value;
				 script: (self bloqueIUpdaterOn: html));
		value: liquidacion p02
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputP03On: html [

	html textInput
			formControl;
			disabled: true;		
			id: 'p03-input';
			value: liquidacion p03
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputP04On: html [

	html textInput
		formControl;
		id: 'p04-input';
		onChange: (html jQuery ajax
				 onComplete: (self goto: '07' on: html);
				 callback: [ :value | liquidacion p04: value asNumber ]
				 value: html jQuery this value;
				 script: (self bloqueIUpdaterOn: html));
		value: liquidacion p04
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputP05On: html [

html textInput
			formControl;
			disabled: true;
			id: 'p05-input';
			value: liquidacion p05
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputP06On: html [

	html textInput
		formControl;
		disabled: true;
		id: 'p06-input';
		value: liquidacion p06
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputP07On: html [

	html textInput
		formControl;
		id: 'p07-input';
		onChange: (html jQuery ajax
				 onComplete: (self goto: '09' on: html);	
				 callback: [ :value | liquidacion p07: value asNumber ]
				 value: html jQuery this value;
				 script: (self bloqueIUpdaterOn: html));
		value: liquidacion p07
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputP08On: html [

	html textInput
		formControl;
		id: 'p08-input';
		onChange: (html jQuery ajax
				 callback: [ :value | liquidacion p08: value asNumber ]
				 value: html jQuery this value;
				 script: (self resultadoUpdaterOn: html));
		value: liquidacion p08
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputP09On: html [

	html textInput
		formControl;
		id: 'p09-input';
		onChange: (html jQuery ajax
				 callback: [ :value | liquidacion p09: value asNumber ]
				 value: html jQuery this value;
				 script: (self resultadoUpdaterOn: html));
		value: liquidacion p09
]

{ #category : #rendering }
M796LiquidacionComponent >> renderInputP10On: html [

	html textInput
		formControl;
		id: 'p10-input';
		disabled: true;	
		value: liquidacion p10
]

{ #category : #rendering }
M796LiquidacionComponent >> renderResultadoOn: html [

	html container: [ 
		html heading
			level: 4;
			with: [ html strong: 'Resultado del pago anticipado' ].
		self renderCamposResultadoOn: html ]
]

{ #category : #rendering }
M796LiquidacionComponent >> renderRowP01On: html [

	html
		column:
		'Importe neto de la cifra de negocion (INCN) derivado de la actividad en España del año natural anterior'
		mediumSize: 9.
	html column: [ self renderInputGroupP01On: html ] mediumSize: 3
]

{ #category : #rendering }
M796LiquidacionComponent >> renderRowP02On: html [

	html
		column:
		'Importes excluidos del INCN'
		mediumSize: 9.
	html column: [ self renderInputGroupP02On: html ] mediumSize: 3
]

{ #category : #rendering }
M796LiquidacionComponent >> renderRowP03On: html [

	html column: 'Base para el cálculo de la prestación [01] - [02]' mediumSize: 9.
	html column: [ self renderInputGroupP03On: html ] mediumSize: 3
]

{ #category : #rendering }
M796LiquidacionComponent >> renderRowP04On: html [

	html
		column: 'Porcentaje aplicable para determinar la prestación'
		mediumSize: 9.
	html column: [ self renderInputGroupP04On: html ] mediumSize: 3
]

{ #category : #rendering }
M796LiquidacionComponent >> renderRowP05On: html [

	html
		column: 'Prestación resultante [03] x [04]'
		mediumSize: 9.
	html column: [ self renderInputGroupP05On: html ] mediumSize: 3
]

{ #category : #rendering }
M796LiquidacionComponent >> renderRowP06On: html [

	html column: 'Base para el cálculo del pago anticipado [03]' mediumSize: 9.
	html column: [ self renderInputGroupP06On: html ] mediumSize: 3
]

{ #category : #rendering }
M796LiquidacionComponent >> renderRowP07On: html [

	html
		column: 'Porcentaje de pago anticipado'
		mediumSize: 9.
	html column: [ self renderInputGroupP07On: html ] mediumSize: 3
]

{ #category : #rendering }
M796LiquidacionComponent >> renderRowP08On: html [

	html
		column: [ 
			html strong: 'Resultado del pago anticipado'.
			html text: '[06] x [07]' ]
		mediumSize: 9.
	html column: [ self renderInputGroupP08On: html ] mediumSize: 3
]

{ #category : #rendering }
M796LiquidacionComponent >> renderRowP09On: html [

	html
		column: [ 
			html text: 'A deducir'.
			html break.
			html small:
				'(Sólo en caso de autoliquidación complementaria; Resultados a ingresar procedente de autoliquidaciones anteriores correspondientes al mismo ejercicio)' ]
		mediumSize: 9.
	html column: [ self renderInputGroupP09On: html ] mediumSize: 3
]

{ #category : #rendering }
M796LiquidacionComponent >> renderRowP10On: html [

	html
		column: [ 
			html strong: 'RESULTADO DEL PAGO ANTICIPADO'.
			html text: '[08] - [09]' ]
		mediumSize: 9.
	html column: [ self renderInputGroupP10On: html ] mediumSize: 3
]

{ #category : #rendering }
M796LiquidacionComponent >> rendererClass [ 

	^ SBSHtmlCanvas 
]

{ #category : #'as yet unclassified' }
M796LiquidacionComponent >> resultadoUpdaterOn: html [

	^ [ :s | 
	  s << (html jQuery id: 'campos-resultado') replaceWith: [ :r | 
		  self renderCamposResultadoOn: r ] ]
]
