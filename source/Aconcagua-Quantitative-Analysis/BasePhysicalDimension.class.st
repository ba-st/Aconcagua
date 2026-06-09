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
	#name : 'BasePhysicalDimension',
	#superclass : 'BaseDimension',
	#instVars : [
		'name',
		'symbol'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'instance creation' }
BasePhysicalDimension class >> named: aName symbol: symbol [

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

{ #category : 'initialization' }
BasePhysicalDimension >> initializeNamed: theName symbol: aSymbol [

  name := theName.
  symbol := aSymbol
]

{ #category : 'accessing' }
BasePhysicalDimension >> name [

  ^ name localized
]

{ #category : 'printing' }
BasePhysicalDimension >> printOn: stream [

  stream nextPutAll: symbol
]

{ #category : 'accessing' }
BasePhysicalDimension >> symbol [

  ^ symbol
]
