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

  ^ BaseDimensions >> #AmountOfSubstance
]

{ #category : 'accessing' }
Dimension class >> angle [

  ^ BaseDimensions >> #Angle
]

{ #category : 'accessing' }
Dimension class >> electricCurrent [

  ^ BaseDimensions >> #ElectricCurrent
]

{ #category : 'class initialization' }
Dimension class >> initializeDimensions [

	<ignoreForCoverage>
  BaseDimensions := Namespace new.
  BaseDimensions bind: #Time to: ( BaseDimension named: 'Time' symbol: 'T' ).
  BaseDimensions
    bind: #ThermodynamicTemperature
    to: ( BaseDimension named: 'Thermodynamic Temperature' symbol: 'Θ' ).
  BaseDimensions bind: #Length to: ( BaseDimension named: 'Length' symbol: 'L' ).
  BaseDimensions bind: #Mass to: ( BaseDimension named: 'Mass' symbol: 'M' ).
  BaseDimensions bind: #ElectricCurrent to: ( BaseDimension named: 'Electric Current' symbol: 'I' ).
  BaseDimensions
    bind: #AmountOfSubstance
    to: ( BaseDimension named: 'Amount of Substance' symbol: 'N' ).
  BaseDimensions
    bind: #LuminousIntensity
    to: ( BaseDimension named: 'Luminous Intensity' symbol: 'J' ).
 BaseDimensions
    bind: #Angle
    to: ( BaseDimension named: 'Plane Angle' symbol: 'A' )
]

{ #category : 'accessing' }
Dimension class >> length [

  ^ BaseDimensions >> #Length
]

{ #category : 'accessing' }
Dimension class >> luminousIntensity [

  ^ BaseDimensions >> #LuminousIntensity
]

{ #category : 'accessing' }
Dimension class >> mass [

  ^ BaseDimensions >> #Mass
]

{ #category : 'accessing' }
Dimension class >> thermodynamicTemperature [

  ^ BaseDimensions >> #ThermodynamicTemperature
]

{ #category : 'accessing' }
Dimension class >> time [

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
