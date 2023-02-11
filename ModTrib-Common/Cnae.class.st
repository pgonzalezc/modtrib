Class {
	#name : #Cnae,
	#superclass : #Object,
	#instVars : [
		'codigo',
		'descripcion'
	],
	#category : #'ModTrib-Common-Tables'
}

{ #category : #'as yet unclassified' }
Cnae class >> connectionStr [

	^ 'psql://ratodalua:rat0da.ua@localhost:5432/pgonzalez'
]

{ #category : #'as yet unclassified' }
Cnae class >> createTable [

	<script>
	
	(P3Client new url: self connectionStr) in: [ :client | 
		[ 
		client execute: 'DROP TABLE IF EXISTS signo.cnae'.
		client execute:
			'CREATE TABLE signo.cnae (codigo VARCHAR(6) PRIMARY KEY, descripcion VARCHAR(256))'.
		client execute: 'GRANT ALL ON TABLE signo.cnae TO pgonzalez'
		"self loadTable: conn" ] ensure: [ client close ] ]
]

{ #category : #'instance creation' }
Cnae class >> fromCode: aCodeString [

	| record |
	record := ((P3Client new url: self connectionStr) in: [ :client | 
		          | statement |
		          [ 
		          (statement := client prepare:
			                        'select codigo, descripcion from signo.cnae where codigo = $1') 
			          query: { aCodeString } ] ensure: [ 
			          statement close.
			          client close ] ]) records.
	^ self basicNew setCodigo: (record first at: 1);
	setDescripcion: (record first at: 2)
]

{ #category : #'as yet unclassified' }
Cnae class >> loadTable [

	<script>
	| statement stream inserted |
	inserted := OrderedCollection new.
	(P3Client new url: self connectionStr) in: [ :client | 
		statement := client prepare:
			             'INSERT INTO signo.cnae(codigo, descripcion) values ($1, $2)'.
		stream := 'resources/cnae.txt' asFileReference readStream.
		[ stream atEnd ] whileFalse: [ 
			| parts |
			parts := Character tab split: stream nextLine.
			(inserted
				includes: (parts at: 1))
				ifFalse: [ inserted add: (parts at: 1). statement execute: parts ] ].
		statement close ]
]

{ #category : #accessing }
Cnae >> codigo [

	^ codigo
]

{ #category : #accessing }
Cnae >> descripcion [

	^ descripcion
]

{ #category : #'private - initialization' }
Cnae >> setCodigo: aCodeString [

	codigo := aCodeString
]

{ #category : #'private - initialization' }
Cnae >> setDescripcion: aString [ 
	
descripcion := aString
]
