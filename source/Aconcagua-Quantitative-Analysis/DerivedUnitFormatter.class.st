Class {
	#name : 'DerivedUnitFormatter',
	#superclass : 'Formatter',
	#instVars : [
		'accessingBlock'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'private' }
DerivedUnitFormatter class >> accessing: unitBlock [

	^self new initializeAccessing: unitBlock
]

{ #category : 'instance creation' }
DerivedUnitFormatter class >> forPluralName [

  ^ self accessing: [ :unit | unit pluralName ]
]

{ #category : 'instance creation' }
DerivedUnitFormatter class >> forSingularName [

  ^ self accessing: [ :unit | unit singularName ]
]

{ #category : 'instance creation' }
DerivedUnitFormatter class >> forSymbol [

  ^ self accessing: [ :unit | unit symbol ]
]

{ #category : 'formatting' }
DerivedUnitFormatter >> format: derivedUnit on: stream [

  derivedUnit isDimensionless then: [ ^ self ].
  derivedUnit
    withPositiveExponentsByUnitDo: [ :exponentsByUnit |
        exponentsByUnit
          ifEmpty: [ stream nextPutAll: '1' ]
          ifNotEmpty: [ self formatProductOf: exponentsByUnit on: stream ]
      ]
    andWithNegativeDo: [ :exponentsByUnit |
        exponentsByUnit ifNotEmpty: [
            stream nextPutAll: '/'.
            self formatProductOf: exponentsByUnit on: stream
          ]
      ]
]

{ #category : 'private' }
DerivedUnitFormatter >> format: unit raisedTo: exponent on: stream [

  stream nextPutAll: ( accessingBlock value: unit ).
  IntegerAsSuperscriptFormatter new format: exponent on: stream
]

{ #category : 'private' }
DerivedUnitFormatter >> formatProductOf: exponentsByUnit on: stream [

  exponentsByUnit keys
    do: [ :unit | self format: unit raisedTo: ( exponentsByUnit at: unit ) on: stream ]
    separatedBy: [ stream nextPutAll: '·' ]
]

{ #category : 'initialization' }
DerivedUnitFormatter >> initializeAccessing: unitBlock [

  accessingBlock := unitBlock
]
