"
A TemperatureUnitsTest is a test class for testing the behavior of DegreeCelsius and DegreeFahrenheit
"
Class {
	#name : 'TemperatureUnitsTest',
	#superclass : 'TestCase',
	#instVars : [
		'kelvin',
		'degreeCelsius',
		'degreeFahrenheit'
	],
	#category : 'Aconcagua-Quantitative-Analysis-Tests',
	#package : 'Aconcagua-Quantitative-Analysis-Tests'
}

{ #category : 'running' }
TemperatureUnitsTest >> setUp [

  super setUp.
  kelvin := BaseUnitOfMeasure
              basedOn: Dimension thermodynamicTemperature
              singularNamed: 'kelvin'
              pluralNamed: 'kelvins'
              symbol: 'K'.
  degreeCelsius := DegreeCelsius basedOn: kelvin.
  degreeFahrenheit := DegreeFahrenheit basedOn: kelvin
]

{ #category : 'tests' }
TemperatureUnitsTest >> testAbsoluteZeroInCelsius [

  | absoluteZero |
  absoluteZero := -27315 / 100.

  self
    assert: 0 * kelvin equals: absoluteZero * degreeCelsius;
    assert: absoluteZero * degreeCelsius equals: 0 * kelvin;
    assert: ( absoluteZero * degreeCelsius ) isZero;
    assert: ( absoluteZero * degreeCelsius convertTo: kelvin ) printString equals: '0 K';
    assert: ( 0 * kelvin convertTo: degreeCelsius ) unit equals: degreeCelsius;
    assert: ( 0 * kelvin convertTo: degreeCelsius ) numericalValue equals: absoluteZero
]

{ #category : 'tests' }
TemperatureUnitsTest >> testAbsoluteZeroInFahrenheit [

  | absoluteZero |
  absoluteZero := -45967 / 100.

  self
    assert: 0 * kelvin equals: absoluteZero * degreeFahrenheit;
    assert: absoluteZero * degreeFahrenheit equals: 0 * kelvin;
    assert: ( absoluteZero * degreeFahrenheit ) isZero;
    assert: ( absoluteZero * degreeFahrenheit convertTo: kelvin ) printString equals: '0 K';
    assert: ( 0 * kelvin convertTo: degreeFahrenheit ) unit equals: degreeFahrenheit;
    assert: ( 0 * kelvin convertTo: degreeFahrenheit ) numericalValue equals: absoluteZero;
    assert: ( absoluteZero * degreeFahrenheit convertTo: degreeCelsius ) unit equals: degreeCelsius;
    assert: ( absoluteZero * degreeFahrenheit convertTo: degreeCelsius ) numericalValue
    equals: -27315 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testAdditionOfKelvins [

  self
    assert: 20 * degreeCelsius + ( 4 * kelvin ) equals: 24 * degreeCelsius;
    assert: ( 20 * degreeCelsius + ( 4 * kelvin ) convertTo: degreeCelsius ) printString
    equals: '24 °C'
]

{ #category : 'tests' }
TemperatureUnitsTest >> testAverageNormalHumanBodyTemperatureInCelsius [

  | temperature |
  temperature := 37.

  self
    assert: 31015 / 100 * kelvin equals: temperature * degreeCelsius;
    assert: temperature * degreeCelsius equals: 31015 / 100 * kelvin;
    assert: ( temperature * degreeCelsius convertTo: kelvin ) unit equals: kelvin;
    assert: ( temperature * degreeCelsius convertTo: kelvin ) numericalValue equals: 31015 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testAverageNormalHumanBodyTemperatureInFahrenheit [

  | temperature |
  temperature := 986 / 10.

  self
    assert: 31015 / 100 * kelvin equals: temperature * degreeFahrenheit;
    assert: temperature * degreeFahrenheit equals: 31015 / 100 * kelvin;
    assert: ( temperature * degreeFahrenheit convertTo: kelvin ) unit equals: kelvin;
    assert: ( temperature * degreeFahrenheit convertTo: kelvin ) numericalValue equals: 31015 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testBoilingPointOfLiquidNitrogenInCelsius [

  | boilingPoint |
  boilingPoint := -1958 / 10.

  self
    assert: 7735 / 100 * kelvin equals: boilingPoint * degreeCelsius;
    assert: boilingPoint * degreeCelsius equals: 7735 / 100 * kelvin;
    assert: ( boilingPoint * degreeCelsius convertTo: kelvin ) unit equals: kelvin;
    assert: ( boilingPoint * degreeCelsius convertTo: kelvin ) numericalValue equals: 7735 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testBoilingPointOfLiquidNitrogenInFahrenheit [

  | boilingPoint |
  boilingPoint := -32044 / 100.

  self
    assert: 7735 / 100 * kelvin equals: boilingPoint * degreeFahrenheit;
    assert: boilingPoint * degreeFahrenheit equals: 7735 / 100 * kelvin;
    assert: ( boilingPoint * degreeFahrenheit convertTo: kelvin ) unit equals: kelvin;
    assert: ( boilingPoint * degreeFahrenheit convertTo: kelvin ) numericalValue equals: 7735 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testBoilingPointOfWaterInCelsius [

  | boilingPoint |
  boilingPoint := 100.

  self
    assert: 37315 / 100 * kelvin equals: boilingPoint * degreeCelsius;
    assert: boilingPoint * degreeCelsius equals: 37315 / 100 * kelvin;
    assert: ( boilingPoint * degreeCelsius convertTo: kelvin ) unit equals: kelvin;
    assert: ( boilingPoint * degreeCelsius convertTo: kelvin ) numericalValue equals: 37315 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testBoilingPointOfWaterInFahrenheit [

  | boilingPoint |
  boilingPoint := 212.

  self
    assert: 37315 / 100 * kelvin equals: boilingPoint * degreeFahrenheit;
    assert: boilingPoint * degreeFahrenheit equals: 37315 / 100 * kelvin;
    assert: ( boilingPoint * degreeFahrenheit convertTo: kelvin ) unit equals: kelvin;
    assert: ( boilingPoint * degreeFahrenheit convertTo: kelvin ) numericalValue
    equals: 37315 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testCommonRoomTemperatureInCelsius [

  | temperature |
  temperature := 20.

  self
    assert: 29315 / 100 * kelvin equals: temperature * degreeCelsius;
    assert: temperature * degreeCelsius equals: 29315 / 100 * kelvin;
    assert: ( temperature * degreeCelsius convertTo: kelvin ) unit equals: kelvin;
    assert: ( temperature * degreeCelsius convertTo: kelvin ) numericalValue equals: 29315 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testCommonRoomTemperatureInFahrenheit [

  | temperature |
  temperature := 68.

  self
    assert: 29315 / 100 * kelvin equals: temperature * degreeFahrenheit;
    assert: temperature * degreeFahrenheit equals: 29315 / 100 * kelvin;
    assert: ( temperature * degreeFahrenheit convertTo: kelvin ) unit equals: kelvin;
    assert: ( temperature * degreeFahrenheit convertTo: kelvin ) numericalValue
    equals: 29315 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testIntersectionOfCelsiusAndFahrenheitScalesInCelsius [

  | intersectionPoint |
  intersectionPoint := -40.

  self
    assert: 23315 / 100 * kelvin equals: intersectionPoint * degreeCelsius;
    assert: intersectionPoint * degreeCelsius equals: 23315 / 100 * kelvin;
    assert: ( intersectionPoint * degreeCelsius convertTo: kelvin ) unit equals: kelvin;
    assert: ( intersectionPoint * degreeCelsius convertTo: kelvin ) numericalValue
    equals: 23315 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testIntersectionOfCelsiusAndFahrenheitScalesInFahrenheit [

  | intersectionPoint |
  intersectionPoint := -40.

  self
    assert: 23315 / 100 * kelvin equals: intersectionPoint * degreeFahrenheit;
    assert: intersectionPoint * degreeFahrenheit equals: 23315 / 100 * kelvin;
    assert: ( intersectionPoint * degreeFahrenheit convertTo: kelvin ) unit equals: kelvin;
    assert: ( intersectionPoint * degreeFahrenheit convertTo: kelvin ) numericalValue
    equals: 23315 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testMeltingPointOfIceInCelsius [

  | meltingPoint |
  meltingPoint := 0.

  self
    assert: 27315 / 100 * kelvin equals: meltingPoint * degreeCelsius;
    assert: meltingPoint * degreeCelsius equals: 27315 / 100 * kelvin;
    assert: ( meltingPoint * degreeCelsius convertTo: kelvin ) unit equals: kelvin;
    assert: ( meltingPoint * degreeCelsius convertTo: kelvin ) numericalValue equals: 27315 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testMeltingPointOfIceInFahrenheit [

  | meltingPoint |
  meltingPoint := 32.

  self
    assert: 27315 / 100 * kelvin equals: meltingPoint * degreeFahrenheit;
    assert: meltingPoint * degreeFahrenheit equals: 27315 / 100 * kelvin;
    assert: ( meltingPoint * degreeFahrenheit convertTo: kelvin ) unit equals: kelvin;
    assert: ( meltingPoint * degreeFahrenheit convertTo: kelvin ) numericalValue
    equals: 27315 / 100
]

{ #category : 'tests' }
TemperatureUnitsTest >> testSublimationPointOfDryIceInCelsius [

  | sublimationPoint |
  sublimationPoint := -7805 / 100.

  self
    assert: 1951 / 10 * kelvin equals: sublimationPoint * degreeCelsius;
    assert: sublimationPoint * degreeCelsius equals: 1951 / 10 * kelvin;
    assert: ( sublimationPoint * degreeCelsius convertTo: kelvin ) unit equals: kelvin;
    assert: ( sublimationPoint * degreeCelsius convertTo: kelvin ) numericalValue equals: 1951 / 10
]

{ #category : 'tests' }
TemperatureUnitsTest >> testSublimationPointOfDryIceInFahrenheit [

  | sublimationPoint |
  sublimationPoint := -10849 / 100.

  self
    assert: 1951 / 10 * kelvin equals: sublimationPoint * degreeFahrenheit;
    assert: sublimationPoint * degreeFahrenheit equals: 1951 / 10 * kelvin;
    assert: ( sublimationPoint * degreeFahrenheit convertTo: kelvin ) unit equals: kelvin;
    assert: ( sublimationPoint * degreeFahrenheit convertTo: kelvin ) numericalValue
    equals: 1951 / 10
]
