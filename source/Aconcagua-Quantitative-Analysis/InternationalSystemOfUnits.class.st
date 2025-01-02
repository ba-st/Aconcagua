"
The International System of Units, denoted SI in all languages, was adopted by the 11th International
Conference on Weights and Measures, CGPM [1960] (Conférence générale des poids et mesures). The SI is
a coherent system of units with respect to the International System of Quantities.

The SI comprises
- base units, and
- derived units
that together form the coherent system of SI units.
"
Class {
	#name : 'InternationalSystemOfUnits',
	#superclass : 'Object',
	#classVars : [
		'Units'
	],
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> addBaseUnitBasedOn: dimension singularNamed: singularName pluralNamed: pluralName symbol: symbol as: key [

  <ignoreForCoverage>
  | unit |
  unit := BaseUnitOfMeasure
            basedOn: dimension
            singularNamed: singularName
            pluralNamed: pluralName
            symbol: symbol.
  Units bind: key asSymbol to: unit.
  ^ unit
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> addMultipleFor: baseUnit prefixedBy: namePrefix and: symbolPrefix raisedTo: exponent as: baseUnitKey [

  <ignoreForCoverage>
  | unit |
  unit := MultipleUnitOfMeasure
            basedOn: baseUnit
            prefixedBy: namePrefix
            symbolPrefixedBy: symbolPrefix
            raisedTo: exponent.
  Units bind: ( namePrefix , baseUnitKey ) asSymbol to: unit
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> addMultiplesAndSubmultiplesOf: baseUnit as: baseUnitKey [

  <ignoreForCoverage>
  self
    addMultipleFor: baseUnit
    prefixedBy: 'yotta'
    and: 'Y'
    raisedTo: 24
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'zetta'
    and: 'Z'
    raisedTo: 21
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'exa'
    and: 'E'
    raisedTo: 18
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'peta'
    and: 'P'
    raisedTo: 15
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'tera'
    and: 'T'
    raisedTo: 12
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'giga'
    and: 'G'
    raisedTo: 9
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'mega'
    and: 'M'
    raisedTo: 6
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'kilo'
    and: 'k'
    raisedTo: 3
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'hecto'
    and: 'h'
    raisedTo: 2
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'deca'
    and: 'da'
    raisedTo: 1
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'deci'
    and: 'd'
    raisedTo: -1
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'centi'
    and: 'c'
    raisedTo: -2
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'milli'
    and: 'm'
    raisedTo: -3
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'micro'
    and: 'µ'
    raisedTo: -6
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'nano'
    and: 'n'
    raisedTo: -9
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'pico'
    and: 'p'
    raisedTo: -12
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'femto'
    and: 'f'
    raisedTo: -15
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'atto'
    and: 'a'
    raisedTo: -18
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'zepto'
    and: 'z'
    raisedTo: -21
    as: baseUnitKey;
    addMultipleFor: baseUnit
    prefixedBy: 'yocto'
    and: 'y'
    raisedTo: -24
    as: baseUnitKey
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeAliasedUnits [

  <ignoreForCoverage>
  self initializeHertz.
  self initializeNewton.
  self initializePascal.
  self initializeJoule.
  self initializeWatt.
  self initializeCoulomb.
  self initializeVolt.
  self initializeFarad.
  self initializeOhm.
  self initializeSiemens.
  self initializeWeber.
  self initializeTesla.
  self initializeHenry.
  self initializeSteradian.
  self initializeLumen.
  self initializeLux
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeAmountOfSubstanceUnits [

  <ignoreForCoverage>
  | mole |
  mole := self
            addBaseUnitBasedOn: Dimension amountOfSubstance
            singularNamed: 'mole'
            pluralNamed: 'moles'
            symbol: 'mol'
            as: #mole.
  self addMultiplesAndSubmultiplesOf: mole as: #mole
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeAngleUnits [

  <ignoreForCoverage>
  self
    addBaseUnitBasedOn: Dimension angle
    singularNamed: 'radian'
    pluralNamed: 'radians'
    symbol: 'rad'
    as: #radian
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeBit [

  <ignoreForCoverage>
  | bit |
  bit := self
           addBaseUnitBasedOn: ( BaseDimension named: 'Information' symbol: 'D' )
           singularNamed: 'bit'
           pluralNamed: 'bits'
           symbol: 'b'
           as: #bit.
  Units
    bind: #kilobit to: ( MultipleUnitOfMeasure
          basedOn: bit
          prefixedBy: 'Kilo'
          symbolPrefixedBy: 'K'
          factor: 1024 );
    bind: #megabit to: ( MultipleUnitOfMeasure
          basedOn: bit
          prefixedBy: 'Mega'
          symbolPrefixedBy: 'M'
          factor: ( 2 raisedTo: 20 ) );
    bind: #gigabit to: ( MultipleUnitOfMeasure
          basedOn: bit
          prefixedBy: 'Giga'
          symbolPrefixedBy: 'G'
          factor: ( 2 raisedTo: 30 ) );
    bind: #terabit to: ( MultipleUnitOfMeasure
          basedOn: bit
          prefixedBy: 'Tera'
          symbolPrefixedBy: 'T'
          factor: ( 2 raisedTo: 40 ) );
    bind: #petabit to: ( MultipleUnitOfMeasure
          basedOn: bit
          prefixedBy: 'Peta'
          symbolPrefixedBy: 'P'
          factor: ( 2 raisedTo: 50 ) );
    bind: #exabit to: ( MultipleUnitOfMeasure
          basedOn: bit
          prefixedBy: 'Exa'
          symbolPrefixedBy: 'E'
          factor: ( 2 raisedTo: 60 ) );
    bind: #zettabit to: ( MultipleUnitOfMeasure
          basedOn: bit
          prefixedBy: 'Zetta'
          symbolPrefixedBy: 'Z'
          factor: ( 2 raisedTo: 70 ) );
    bind: #yottabit to: ( MultipleUnitOfMeasure
          basedOn: bit
          prefixedBy: 'Yotta'
          symbolPrefixedBy: 'Y'
          factor: ( 2 raisedTo: 80 ) )
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeByte [

  <ignoreForCoverage>
  | byte |
  byte := MultipleUnitOfMeasure
            basedOn: Units >> #bit
            singularNamed: 'byte'
            pluralNamed: 'bytes'
            symbol: 'B'
            factor: 8.
  Units bind: #byte to: byte.
  Units
    bind: #kilobyte to: ( MultipleUnitOfMeasure
          basedOn: byte
          prefixedBy: 'Kilo'
          symbolPrefixedBy: 'K'
          factor: 1024 );
    bind: #megabyte to: ( MultipleUnitOfMeasure
          basedOn: byte
          prefixedBy: 'Mega'
          symbolPrefixedBy: 'M'
          factor: ( 2 raisedTo: 20 ) );
    bind: #gigabyte to: ( MultipleUnitOfMeasure
          basedOn: byte
          prefixedBy: 'Giga'
          symbolPrefixedBy: 'G'
          factor: ( 2 raisedTo: 30 ) );
    bind: #terabyte to: ( MultipleUnitOfMeasure
          basedOn: byte
          prefixedBy: 'Tera'
          symbolPrefixedBy: 'T'
          factor: ( 2 raisedTo: 40 ) );
    bind: #petabyte to: ( MultipleUnitOfMeasure
          basedOn: byte
          prefixedBy: 'Peta'
          symbolPrefixedBy: 'P'
          factor: ( 2 raisedTo: 50 ) );
    bind: #exabyte to: ( MultipleUnitOfMeasure
          basedOn: byte
          prefixedBy: 'Exa'
          symbolPrefixedBy: 'E'
          factor: ( 2 raisedTo: 60 ) );
    bind: #zettabyte to: ( MultipleUnitOfMeasure
          basedOn: byte
          prefixedBy: 'Zetta'
          symbolPrefixedBy: 'Z'
          factor: ( 2 raisedTo: 70 ) );
    bind: #yottabyte to: ( MultipleUnitOfMeasure
          basedOn: byte
          prefixedBy: 'Yotta'
          symbolPrefixedBy: 'Y'
          factor: ( 2 raisedTo: 80 ) )
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeCoulomb [

  <ignoreForCoverage>
  | coulomb |
  coulomb := Units >> #ampere * ( Units >> #second )
               aliasedBy: 'coulomb'
               plural: 'coulombs'
               symbol: 'C'.
  Units bind: #coulomb to: coulomb
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeElectricCurrentUnits [

  <ignoreForCoverage>
  | ampere |
  ampere := self
              addBaseUnitBasedOn: Dimension electricCurrent
              singularNamed: 'ampere'
              pluralNamed: 'amperes'
              symbol: 'A'
              as: #ampere.
  self addMultiplesAndSubmultiplesOf: ampere as: #ampere
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeExtraAreaUnits [

  <ignoreForCoverage>
  Units
    bind: #are to: ( MultipleUnitOfMeasure
          basedOn: ( Units >> #meter ) squared
          singularNamed: 'are'
          pluralNamed: 'ares'
          symbol: 'a'
          factor: 100 );
    bind: #hectare to: ( MultipleUnitOfMeasure
          basedOn: Units >> #are
          prefixedBy: 'hect'
          symbolPrefixedBy: 'h'
          raisedTo: 2 )
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeExtraMassUnits [

  <ignoreForCoverage>
  Units bind: #tonne to: ( MultipleUnitOfMeasure
        basedOn: Units >> #gram
        singularNamed: 'tonne'
        pluralNamed: 'tonnes'
        symbol: 't'
        raisedTo: 6 )
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeExtraTimeUnits [

  <ignoreForCoverage>
  Units
    bind: #minute to: ( MultipleUnitOfMeasure
          basedOn: Units >> #second
          singularNamed: 'minute'
          pluralNamed: 'minutes'
          symbol: 'min'
          factor: 60 );
    bind: #hour to: ( MultipleUnitOfMeasure
          basedOn: Units >> #second
          singularNamed: 'hour'
          pluralNamed: 'hours'
          symbol: 'h'
          factor: 3600 );
    bind: #day to: ( MultipleUnitOfMeasure
          basedOn: Units >> #second
          singularNamed: 'day'
          pluralNamed: 'days'
          symbol: 'd'
          factor: 86400 )
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeExtraUnits [
  "There are certain non-SI units that are recognized by the International Committee for
	Weights and Measures as having to be retained for use together with the SI."

  <ignoreForCoverage>
  self initializeExtraTimeUnits.
  self initializeExtraMassUnits.
  self initializeExtraAreaUnits.
  self initializeExtraVolumeUnits
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeExtraVolumeUnits [

  <ignoreForCoverage>
  Units
    bind: #litre
    to:
    ( ( Units >> #decimeter raisedToInteger: 3 ) aliasedBy: 'litre' plural: 'litres' symbol: 'l' ).
  self addMultiplesAndSubmultiplesOf: Units >> #litre as: #litre
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeFarad [

  <ignoreForCoverage>
  | farad |
  farad := Units >> #coulomb / ( Units >> #volt ) aliasedBy: 'farad' plural: 'farads' symbol: 'F'.
  Units bind: #farad to: farad
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeHenry [

  <ignoreForCoverage>
  | henry |
  henry := Units >> #weber / ( Units >> #ampere ) aliasedBy: 'henry' plural: 'henries' symbol: 'H'.
  Units bind: #henry to: henry
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeHertz [

  <ignoreForCoverage>
  | hertz |
  hertz := ( Units >> #second ) inverse aliasedBy: 'hertz' plural: 'hertz' symbol: 'Hz'.
  Units bind: #hertz to: hertz
  "self addMultiplesAndSubmultiplesOf: hertz"
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeInformationUnits [

  <ignoreForCoverage>
  self initializeBit.
  self initializeByte
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeJoule [

  <ignoreForCoverage>
  | joule |
  joule := Units >> #newton * ( Units >> #meter ) aliasedBy: 'joule' plural: 'joules' symbol: 'J'.
  Units bind: #joule to: joule
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeLengthUnits [

  <ignoreForCoverage>
  | meter |
  meter := self
             addBaseUnitBasedOn: Dimension length
             singularNamed: 'meter'
             pluralNamed: 'meters'
             symbol: 'm'
             as: #meter.
  self addMultiplesAndSubmultiplesOf: meter as: #meter
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeLumen [

  <ignoreForCoverage>
  | lumen |
  lumen := Units >> #candela * ( Units >> #steradian )
             aliasedBy: 'lumen'
             plural: 'lumens'
             symbol: 'lm'.
  Units bind: #lumen to: lumen
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeLuminousIntensityUnits [

  <ignoreForCoverage>
  | candela |
  candela := self
               addBaseUnitBasedOn: Dimension luminousIntensity
               singularNamed: 'candela'
               pluralNamed: 'candelas'
               symbol: 'cd'
               as: #candela.
  self addMultiplesAndSubmultiplesOf: candela as: #candela
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeLux [

  <ignoreForCoverage>
  | lux |
  lux := Units >> #lumen / ( Units >> #meter ) squared aliasedBy: 'lux' plural: 'lux' symbol: 'lx'.
  Units bind: #lux to: lux
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeMassUnits [

  <ignoreForCoverage>
  | gram |
  gram := self
            addBaseUnitBasedOn: Dimension mass
            singularNamed: 'gram'
            pluralNamed: 'grams'
            symbol: 'g'
            as: #gram.
  self addMultiplesAndSubmultiplesOf: gram as: #gram
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeNewton [

  <ignoreForCoverage>
  | newton |
  newton := Units >> #kilogram * ( Units >> #meter ) / ( Units >> #second ) squared
              aliasedBy: 'newton'
              plural: 'newtons'
              symbol: 'N'.
  Units bind: #newton to: newton
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeOhm [

  <ignoreForCoverage>
  | ohm |
  ohm := Units >> #volt / ( Units >> #ampere ) aliasedBy: 'ohm' plural: 'ohms' symbol: 'Ω'.
  Units bind: #ohm to: ohm
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializePascal [

  <ignoreForCoverage>
  | pascal |
  pascal := Units >> #newton / ( Units >> #meter ) squared
              aliasedBy: 'pascal'
              plural: 'pascals'
              symbol: 'Pa'.
  Units bind: #pascal to: pascal
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeSiemens [

  <ignoreForCoverage>
  | siemens |
  siemens := ( Units >> #ohm ) inverse aliasedBy: 'siemens' plural: 'siemens' symbol: 'S'.
  Units bind: #siemens to: siemens
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeSteradian [

  <ignoreForCoverage>
  | steradian |
  steradian := ( Units >> #radian ) squared aliasedBy: 'steradian' plural: 'steradians' symbol: 'sr'.
  Units bind: #steradian to: steradian
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeTesla [

  <ignoreForCoverage>
  | tesla |
  tesla := Units >> #weber / ( Units >> #meter ) squared
             aliasedBy: 'tesla'
             plural: 'teslas'
             symbol: 'T'.
  Units bind: #tesla to: tesla
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeThermodynamicTemperatureUnits [

  <ignoreForCoverage>
  | kelvin |
  kelvin := self
              addBaseUnitBasedOn: Dimension thermodynamicTemperature
              singularNamed: 'kelvin'
              pluralNamed: 'kelvins'
              symbol: 'K'
              as: #kelvin.
  self addMultiplesAndSubmultiplesOf: kelvin as: #kelvin.
  Units bind: #degreeCelsius to: ( DegreeCelsius basedOn: kelvin )
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeTimeUnits [

  <ignoreForCoverage>
  | second |
  second := self
              addBaseUnitBasedOn: Dimension time
              singularNamed: 'second'
              pluralNamed: 'seconds'
              symbol: 's'
              as: #second.
  self addMultiplesAndSubmultiplesOf: second as: #second
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeUnits [

  <ignoreForCoverage>
  Units := Namespace new.
  LanguagePlatform current globalNamed: #SI ifAbsentPut: [ Units ].
  self
    initializeLengthUnits;
    initializeTimeUnits;
    initializeMassUnits;
    initializeElectricCurrentUnits;
    initializeThermodynamicTemperatureUnits;
    initializeAmountOfSubstanceUnits;
    initializeLuminousIntensityUnits;
    initializeAngleUnits;
    initializeExtraUnits;
    initializeAliasedUnits;
    initializeInformationUnits
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeVolt [

  <ignoreForCoverage>
  | volt |
  volt := Units >> #watt / ( Units >> #ampere ) aliasedBy: 'volt' plural: 'volts' symbol: 'V'.
  Units bind: #volt to: volt
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeWatt [

  <ignoreForCoverage>
  | watt |
  watt := Units >> #joule / ( Units >> #second ) aliasedBy: 'watt' plural: 'watts' symbol: 'W'.
  Units bind: #watt to: watt
]

{ #category : 'class initialization' }
InternationalSystemOfUnits class >> initializeWeber [

  <ignoreForCoverage>
  | weber |
  weber := Units >> #volt * ( Units >> #second ) aliasedBy: 'weber' plural: 'webers' symbol: 'Wb'.
  Units bind: #weber to: weber
]

{ #category : 'accessing' }
InternationalSystemOfUnits class >> units [

  Units ifNil: [ self initializeUnits ].
  ^ Units
]
