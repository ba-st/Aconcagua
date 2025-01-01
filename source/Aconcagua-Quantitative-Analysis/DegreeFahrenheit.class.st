"
The Fahrenheit scale is a temperature scale based on one proposed in 1724 by the European physicist Daniel Gabriel Fahrenheit.
It uses the degree Fahrenheit (symbol: °F) as the unit.
"
Class {
	#name : 'DegreeFahrenheit',
	#superclass : 'UnitOfMeasure',
	#instVars : [
		'kelvin'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'instance creation' }
DegreeFahrenheit class >> basedOn: kelvin [

  ^ self new initializeBasedOn: kelvin
]

{ #category : 'converting' }
DegreeFahrenheit >> asCanonicalUnit [

  ^ kelvin
]

{ #category : 'accessing' }
DegreeFahrenheit >> dimension [

  ^ kelvin dimension
]

{ #category : 'accessing' }
DegreeFahrenheit >> factor [

  ^ 5 / 9
]

{ #category : 'initialization' }
DegreeFahrenheit >> initializeBasedOn: theKelvin [

  kelvin := theKelvin
]

{ #category : 'arithmetic' }
DegreeFahrenheit >> inverse [
  "This unit has the problem that 0 on the canonical unit is not equal to zero
	in this unit. So allowing inverting can cause unexpected divisions by zero"

  ArithmeticError signal: 'Inverting degrees Fahrenheit is unsupported' localized
]

{ #category : 'accessing' }
DegreeFahrenheit >> offset [

  ^ 45967 / 100
]

{ #category : 'accessing' }
DegreeFahrenheit >> pluralName [

  ^ 'degrees Fahrenheit' localized
]

{ #category : 'accessing' }
DegreeFahrenheit >> singularName [

  ^ 'degree Fahrenheit' localized
]

{ #category : 'accessing' }
DegreeFahrenheit >> symbol [

  ^ '°F'
]

{ #category : 'evaluating' }
DegreeFahrenheit >> valueFromCanonicalUnit: number [

  ^ ( number * self factor reciprocal ) - self offset
]

{ #category : 'evaluating' }
DegreeFahrenheit >> valueInCanonicalUnit: number [

  ^ self factor * ( number + self offset )
]
