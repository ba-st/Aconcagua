"
A base dimension is a fundamental dimension.
According to the International System of Units, there are 7 base dimensions:
- Time
- Length
- Mass
- Electric Current
- Thermodynamic Temperature
- Amount of Substance
- Luminous Intensity
"
Class {
	#name : 'BaseDimension',
	#superclass : 'Dimension',
	#instVars : [
		'name',
		'symbol'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'instance creation' }
BaseDimension class >> named: aName symbol: symbol [

  AssertionCheckerBuilder new
    raising: InstanceCreationFailed;
    checking: [ :asserter |
        asserter
          enforce: [ aName notEmpty ] because: 'A dimension name cannot be empty';
          enforce: [ symbol notEmpty ] because: 'A dimension symbol cannot be empty'
      ];
    buildAndCheck.

  ^ self new initializeNamed: aName symbol: symbol
]

{ #category : 'arithmetic' }
BaseDimension >> * aDimension [

  ^ self = aDimension
      then: [ DerivedDimension from: self raisedTo: 2 ]
      otherwise: [ aDimension productWithBaseDimension: self ]
]

{ #category : 'initialization' }
BaseDimension >> initializeNamed: theName symbol: aSymbol [

  name := theName.
  symbol := aSymbol
]

{ #category : 'arithmetic' }
BaseDimension >> inverse [

  ^ DerivedDimension from: self raisedTo: -1
]

{ #category : 'testing' }
BaseDimension >> isDimensionless [

  ^ false
]

{ #category : 'accessing' }
BaseDimension >> name [

  ^ name localized
]

{ #category : 'printing' }
BaseDimension >> printOn: stream [

  stream nextPutAll: symbol
]

{ #category : 'private' }
BaseDimension >> productWithBaseDimension: baseDimention [

  ^ DerivedDimension from: self and: baseDimention
]

{ #category : 'private' }
BaseDimension >> productWithDerivedDimension: aDerivedDimension [

  ^ aDerivedDimension productWithBaseDimension: self
]

{ #category : 'accessing' }
BaseDimension >> symbol [

  ^ symbol
]
