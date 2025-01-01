"
The degree Celsius is the unit of temperature on the Celsius temperature scale
"
Class {
	#name : 'DegreeCelsius',
	#superclass : 'UnitOfMeasure',
	#instVars : [
		'kelvin'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'instance creation' }
DegreeCelsius class >> basedOn: kelvin [

  ^ self new initializeBasedOn: kelvin
]

{ #category : 'converting' }
DegreeCelsius >> asCanonicalUnit [

  ^ kelvin
]

{ #category : 'accessing' }
DegreeCelsius >> dimension [

  ^ kelvin dimension
]

{ #category : 'initialization' }
DegreeCelsius >> initializeBasedOn: theKelvin [

  kelvin := theKelvin
]

{ #category : 'arithmetic' }
DegreeCelsius >> inverse [
  "This unit has the problem that 0 on the canonical unit is not equal to zero
	in this unit. So allowing inverting can cause unexpected divisions by zero"

  ArithmeticError signal: 'Inverting degrees Celsius is unsupported' localized
]

{ #category : 'accessing' }
DegreeCelsius >> offset [

  ^ 27315 / 100
]

{ #category : 'accessing' }
DegreeCelsius >> pluralName [

  ^ 'degrees Celsius' localized
]

{ #category : 'accessing' }
DegreeCelsius >> singularName [

  ^ 'degree Celsius' localized
]

{ #category : 'accessing' }
DegreeCelsius >> symbol [

  ^ '°C'
]

{ #category : 'evaluating' }
DegreeCelsius >> valueFromCanonicalUnit: number [

  ^ number - self offset
]

{ #category : 'evaluating' }
DegreeCelsius >> valueInCanonicalUnit: number [

  ^ number + self offset
]
