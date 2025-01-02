"
United States customary units form a system of measurement units commonly used in the United States and most U.S. territories
"
Class {
	#name : 'USCustomaryUnits',
	#superclass : 'Object',
	#classVars : [
		'Units'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'private' }
USCustomaryUnits class >> gram [

  <ignoreForCoverage>
  ^ InternationalSystemOfUnits units >> #gram
]

{ #category : 'class initialization' }
USCustomaryUnits class >> initializeDryVolumeUnits [

  <ignoreForCoverage>
  | pintInLitre |
  pintInLitre := 55061047135749 / ( 10 raisedTo: 14 ).
  Units
    bind: #dryPint to: ( MultipleUnitOfMeasure
          basedOn: self litre
          singularNamed: 'pint (dry)'
          pluralNamed: 'pints (dry)'
          symbol: 'pt'
          factor: pintInLitre );
    bind: #dryQuart to: ( MultipleUnitOfMeasure
          basedOn: self litre
          singularNamed: 'quart (dry)'
          pluralNamed: 'quarts (dry)'
          symbol: 'qt'
          factor: 2 * pintInLitre );
    bind: #dryGallon to: ( MultipleUnitOfMeasure
          basedOn: self litre
          singularNamed: 'gallon (dry)'
          pluralNamed: 'gallons (dry)'
          symbol: 'gal'
          factor: 8 * pintInLitre );
    bind: #peck to: ( MultipleUnitOfMeasure
          basedOn: self litre
          singularNamed: 'peck'
          pluralNamed: 'pecks'
          symbol: 'pk'
          factor: 16 * pintInLitre );
    bind: #bushel to: ( MultipleUnitOfMeasure
          basedOn: self litre
          singularNamed: 'bushel'
          pluralNamed: 'bushels'
          symbol: 'bu'
          factor: 64 * pintInLitre );
    bind: #dryBarrel to: ( MultipleUnitOfMeasure
          basedOn: self litre
          singularNamed: 'barrel (dry)'
          pluralNamed: 'barrels (dry)'
          symbol: 'bbl'
          factor: 210 * pintInLitre )
]

{ #category : 'class initialization' }
USCustomaryUnits class >> initializeFluidVolumeUnits [

  <ignoreForCoverage>
  | teaspoonInMl |
  teaspoonInMl := 492892159375 / ( 10 raisedTo: 11 ).
  Units
    bind: #teaspoon to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'teaspoon'
          pluralNamed: 'teaspoons'
          symbol: 'tsp'
          factor: teaspoonInMl );
    bind: #tablespoon to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'tablespoon'
          pluralNamed: 'tablespoons'
          symbol: 'tbsp'
          factor: 3 * teaspoonInMl );
    bind: #fluidOunce to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'fluid ounce'
          pluralNamed: 'fluid ounces'
          symbol: 'floz'
          factor: 2 * 3 * teaspoonInMl );
    bind: #shot to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'shot'
          pluralNamed: 'shots'
          symbol: 'jig'
          factor: 3 * 3 * teaspoonInMl );
    bind: #gill to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'gill'
          pluralNamed: 'gills'
          symbol: 'jig'
          factor: 24 * teaspoonInMl );
    bind: #cup to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'cup'
          pluralNamed: 'cups'
          symbol: 'c'
          factor: 48 * teaspoonInMl );
    bind: #fluidPint to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'pint (liquid)'
          pluralNamed: 'pints (liquid)'
          symbol: 'pint'
          factor: 96 * teaspoonInMl );
    bind: #fluidQuart to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'quart (liquid)'
          pluralNamed: 'quarts (liquid)'
          symbol: 'qt'
          factor: 192 * teaspoonInMl );
    bind: #pottle to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'pottle'
          pluralNamed: 'pottles'
          symbol: 'pot'
          factor: 384 * teaspoonInMl );
    bind: #fluidGallon to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'gallon (liquid)'
          pluralNamed: 'gallons (liquid)'
          symbol: 'gal'
          factor: 768 * teaspoonInMl );
    bind: #fluidBarrel to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'barrel (liquid)'
          pluralNamed: 'barrels (liquid)'
          symbol: 'bbl'
          factor: 24192 * teaspoonInMl );
    bind: #oilBarrel to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'barrel (oil)'
          pluralNamed: 'barrels (oil)'
          symbol: 'bbl'
          factor: 32256 * teaspoonInMl );
    bind: #hogshead to: ( MultipleUnitOfMeasure
          basedOn: self millilitre
          singularNamed: 'hogshead'
          pluralNamed: 'hogsheads'
          symbol: 'hhd'
          factor: 48384 * teaspoonInMl )
]

{ #category : 'class initialization' }
USCustomaryUnits class >> initializeLengthUnits [

  <ignoreForCoverage>
  Units
    bind: #point to: ( MultipleUnitOfMeasure
          basedOn: self meter
          singularNamed: 'point'
          pluralNamed: 'points'
          symbol: 'p'
          factor: 127 / 360000 );
    bind: #pica to: ( MultipleUnitOfMeasure
          basedOn: self meter
          singularNamed: 'pica'
          pluralNamed: 'picas'
          symbol: 'P'
          factor: 127 / 30000 );
    bind: #inch to: ( MultipleUnitOfMeasure
          basedOn: self meter
          singularNamed: 'inch'
          pluralNamed: 'inches'
          symbol: 'in'
          factor: 254 / 10000 );
    bind: #foot to: ( MultipleUnitOfMeasure
          basedOn: self meter
          singularNamed: 'foot'
          pluralNamed: 'feet'
          symbol: 'ft'
          factor: 3048 / 10000 );
    bind: #yard to: ( MultipleUnitOfMeasure
          basedOn: self meter
          singularNamed: 'yard'
          pluralNamed: 'yards'
          symbol: 'yd'
          factor: 9144 / 10000 );
    bind: #mile to: ( MultipleUnitOfMeasure
          basedOn: self meter
          singularNamed: 'mile'
          pluralNamed: 'miles'
          symbol: 'mi'
          factor: 1609344 / 1000 );
    bind: #league to: ( MultipleUnitOfMeasure
          basedOn: self meter
          singularNamed: 'league'
          pluralNamed: 'leagues'
          symbol: 'le'
          factor: 4828032 / 1000 )
]

{ #category : 'class initialization' }
USCustomaryUnits class >> initializeMassUnits [

  <ignoreForCoverage>
  | grainInMilligram poundInGrams |
  grainInMilligram := 6479891 / ( 10 raisedTo: 5 ).
  poundInGrams := 45359237 / ( 10 raisedTo: 5 ).
  Units
    bind: #grain to: ( MultipleUnitOfMeasure
          basedOn: self milligram
          singularNamed: 'grain'
          pluralNamed: 'grains'
          symbol: 'gr'
          factor: grainInMilligram );
    bind: #dram to: ( MultipleUnitOfMeasure
          basedOn: self gram
          singularNamed: 'dram'
          pluralNamed: 'drams'
          symbol: 'dr'
          factor: poundInGrams / 256 );
    bind: #ounce to: ( MultipleUnitOfMeasure
          basedOn: self gram
          singularNamed: 'ounce'
          pluralNamed: 'ounces'
          symbol: 'oz'
          factor: poundInGrams / 16 );
    bind: #pound to: ( MultipleUnitOfMeasure
          basedOn: self gram
          singularNamed: 'pound'
          pluralNamed: 'pounds'
          symbol: 'lb'
          factor: poundInGrams );
    bind: #shortHundredweight to: ( MultipleUnitOfMeasure
          basedOn: self gram
          singularNamed: 'short hundredweight'
          pluralNamed: 'short hundredweights'
          symbol: 'US cwt'
          factor: 100 * poundInGrams );
    bind: #longHundredweight to: ( MultipleUnitOfMeasure
          basedOn: self gram
          singularNamed: 'long hundredweight'
          pluralNamed: 'long hundredweights'
          symbol: 'long cwt'
          factor: 112 * poundInGrams );
    bind: #shortTon to: ( MultipleUnitOfMeasure
          basedOn: self gram
          singularNamed: 'short ton::singular'
          pluralNamed: 'short ton::plural'
          symbol: 'short ton'
          factor: 2000 * poundInGrams );
    bind: #longTon to: ( MultipleUnitOfMeasure
          basedOn: self gram
          singularNamed: 'long ton::singular'
          pluralNamed: 'long ton::plural'
          symbol: 'ton'
          factor: 2240 * poundInGrams );
    bind: #pennyweight to: ( MultipleUnitOfMeasure
          basedOn: self milligram
          singularNamed: 'pennyweight'
          pluralNamed: 'pennyweights'
          symbol: 'dwt'
          factor: 24 * grainInMilligram );
    bind: #troyOunce to: ( MultipleUnitOfMeasure
          basedOn: self milligram
          singularNamed: 'troy ounce'
          pluralNamed: 'troy ounces'
          symbol: 'ozt'
          factor: 480 * grainInMilligram );
    bind: #troyPound to: ( MultipleUnitOfMeasure
          basedOn: self milligram
          singularNamed: 'troy pound'
          pluralNamed: 'troy pounds'
          symbol: 'lbt'
          factor: 5760 * grainInMilligram )
]

{ #category : 'class initialization' }
USCustomaryUnits class >> initializeUnits [

  <ignoreForCoverage>
  Units := Namespace new.
  self initializeLengthUnits.
  Units
    bind: #degreeFarenheit
    to: ( DegreeFahrenheit basedOn: InternationalSystemOfUnits units >> #kelvin ).
  self
    initializeFluidVolumeUnits;
    initializeDryVolumeUnits;
    initializeMassUnits
]

{ #category : 'private' }
USCustomaryUnits class >> litre [

  <ignoreForCoverage>
  ^ InternationalSystemOfUnits units >> #litre
]

{ #category : 'private' }
USCustomaryUnits class >> meter [

  <ignoreForCoverage>
  ^ InternationalSystemOfUnits units >> #meter
]

{ #category : 'private' }
USCustomaryUnits class >> milligram [

  <ignoreForCoverage>
  ^ InternationalSystemOfUnits units >> #milligram
]

{ #category : 'private' }
USCustomaryUnits class >> millilitre [

  <ignoreForCoverage>
  ^ InternationalSystemOfUnits units >> #millilitre
]

{ #category : 'class initialization' }
USCustomaryUnits class >> units [

  ^ Units
]
