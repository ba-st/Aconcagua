"
I'm a formatter turning an integer into a string with a superscript version of the number
"
Class {
	#name : 'IntegerAsSuperscriptFormatter',
	#superclass : 'Formatter',
	#instVars : [
		'digitToSuperscriptMapping'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Aconcagua-Arithmetic',
	#package : 'Aconcagua-Arithmetic'
}

{ #category : 'class initialization' }
IntegerAsSuperscriptFormatter class >> initialize [ 

	uniqueInstance := super new
]

{ #category : 'instance creation' }
IntegerAsSuperscriptFormatter class >> new [

  uniqueInstance ifNil: [ self initialize ].
  ^ uniqueInstance
]

{ #category : 'formatting' }
IntegerAsSuperscriptFormatter >> format: integer on: stream [

  [
    | integerAsString |
    integerAsString := integer printString.
    integerAsString do: [ :character |
        digitToSuperscriptMapping
          at: character
          ifPresent: [ :superscript | stream nextPutAll: superscript ]
          ifAbsent: [ stream nextPut: character ]
      ]
  ] unless: integer = 1
]

{ #category : 'initialization' }
IntegerAsSuperscriptFormatter >> initialize [

  super initialize.
  digitToSuperscriptMapping := IdentityDictionary new.
  digitToSuperscriptMapping
    at: $0 put: '⁰';
    at: $1 put: '¹';
    at: $2 put: '²';
    at: $3 put: '³';
    at: $4 put: '⁴';
    at: $5 put: '⁵';
    at: $6 put: '⁶';
    at: $7 put: '⁷';
    at: $8 put: '⁸';
    at: $9 put: '⁹';
    at: $- put: '⁻'
]
