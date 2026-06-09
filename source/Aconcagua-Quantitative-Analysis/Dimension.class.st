"
In dimensional analysis, a dimension refers to a fundamental physical property that can be expressed in terms of basic quantities.
Each physical quantity can be described by a combination of dimensions, which are typically represented using these base quantities.
"
Class {
	#name : 'Dimension',
	#superclass : 'Object',
	#classVars : [
		'BaseDimensions'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'accessing' }
Dimension class >> amountOfSubstance [

  BaseDimensions ifNil: [ self initializeDimensions ].
  ^ BaseDimensions >> #AmountOfSubstance
]

{ #category : 'accessing' }
Dimension class >> angle [

  BaseDimensions ifNil: [ self initializeDimensions ].
  ^ BaseDimensions >> #Angle
]

{ #category : 'accessing' }
Dimension class >> electricCurrent [

  BaseDimensions ifNil: [ self initializeDimensions ].
  ^ BaseDimensions >> #ElectricCurrent
]

{ #category : 'class initialization' }
Dimension class >> initializeDimensions [

  <ignoreForCoverage>
  BaseDimensions := Namespace new.
  BaseDimensions bind: #Time to: ( BasePhysicalDimension named: 'Time' symbol: 'T' ).
  BaseDimensions
    bind: #ThermodynamicTemperature
    to: ( BasePhysicalDimension named: 'Thermodynamic Temperature' symbol: 'Θ' ).
  BaseDimensions bind: #Length to: ( BasePhysicalDimension named: 'Length' symbol: 'L' ).
  BaseDimensions bind: #Mass to: ( BasePhysicalDimension named: 'Mass' symbol: 'M' ).
  BaseDimensions bind: #ElectricCurrent to: ( BasePhysicalDimension named: 'Electric Current' symbol: 'I' ).
  BaseDimensions
    bind: #AmountOfSubstance
    to: ( BasePhysicalDimension named: 'Amount of Substance' symbol: 'N' ).
  BaseDimensions
    bind: #LuminousIntensity
    to: ( BasePhysicalDimension named: 'Luminous Intensity' symbol: 'J' ).
  BaseDimensions bind: #Angle to: ( BasePhysicalDimension named: 'Plane Angle' symbol: 'A' )
]

{ #category : 'accessing' }
Dimension class >> length [

  BaseDimensions ifNil: [ self initializeDimensions ].
  ^ BaseDimensions >> #Length
]

{ #category : 'accessing' }
Dimension class >> luminousIntensity [

  BaseDimensions ifNil: [ self initializeDimensions ].
  ^ BaseDimensions >> #LuminousIntensity
]

{ #category : 'accessing' }
Dimension class >> mass [

  BaseDimensions ifNil: [ self initializeDimensions ].
  ^ BaseDimensions >> #Mass
]

{ #category : 'accessing' }
Dimension class >> thermodynamicTemperature [

  BaseDimensions ifNil: [ self initializeDimensions ].
  ^ BaseDimensions >> #ThermodynamicTemperature
]

{ #category : 'accessing' }
Dimension class >> time [

  BaseDimensions ifNil: [ self initializeDimensions ].
  ^ BaseDimensions >> #Time
]

{ #category : 'arithmetic' }
Dimension >> * aDimension [

  ^ self subclassResponsibility
]

{ #category : 'arithmetic' }
Dimension >> / aDimension [

  ^ self * aDimension inverse
]

{ #category : 'arithmetic' }
Dimension >> inverse [

  ^ self subclassResponsibility
]

{ #category : 'testing' }
Dimension >> isDimensionless [

  ^ self subclassResponsibility
]

{ #category : 'private' }
Dimension >> productWithBaseDimension: baseDimension [

  self subclassResponsibility
]

{ #category : 'private' }
Dimension >> productWithDerivedDimension: derivedDimension [

  self subclassResponsibility
]

{ #category : 'arithmetic' }
Dimension >> squared [

  ^ self * self
]
