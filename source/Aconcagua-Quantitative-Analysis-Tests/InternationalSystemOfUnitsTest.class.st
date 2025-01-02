"
An InternationalSystemOfUnitsTest is a test class for testing the behavior of InternationalSystemOfUnits
"
Class {
	#name : 'InternationalSystemOfUnitsTest',
	#superclass : 'TestCase',
	#category : 'Aconcagua-Quantitative-Analysis-Tests',
	#package : 'Aconcagua-Quantitative-Analysis-Tests'
}

{ #category : 'private' }
InternationalSystemOfUnitsTest >> assertUnit: unitSymbol isCommensurableWith: anotherUnitSymbol [

  self assert: ( ( self unit: unitSymbol ) isCommensurableWith: ( self unit: anotherUnitSymbol ) )
]

{ #category : 'private' }
InternationalSystemOfUnitsTest >> oneOf: unitSymbol [

  ^ ( self unit: unitSymbol ) * 1
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testAreaUnits [

  | are hectare |
  are := self unit: #are.
  hectare := self unit: #hectare.

  self
    assert: 1 * are equals: 100 * ( self unit: #meter ) squared;
    assert: ( 15 * are ) printString equals: '15 a';
    assert: 1 * hectare equals: 100 * are
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testCoulomb [

  | ampere coulomb second ampereSecond |
  coulomb := self unit: #coulomb.
  ampere := self unit: #ampere.
  second := self unit: #second.
  ampereSecond := ampere * second.
  self
    assert: ( coulomb isCommensurableWith: ampereSecond );
    assert: coulomb singularName equals: 'coulomb';
    assert: coulomb pluralName equals: 'coulombs';
    assert: coulomb symbol equals: 'C';
    assert: coulomb dimension equals: Dimension electricCurrent * Dimension time;
    assert: 9 * coulomb equals: 9 * ampereSecond;
    assert: ( 3 * coulomb + ( 4 * coulomb ) ) printString equals: '7 C';
    assert: ( 3 * coulomb + ( 4 * ampereSecond ) ) printString equals: '7 C';
    assert: ( 4 * ampereSecond + ( 3 * coulomb ) ) printString equals: '7 A·s'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testDegreeCelsius [

  | degreeCelsius kelvin kilometer |
  degreeCelsius := self unit: #degreeCelsius.
  kelvin := self unit: #kelvin.
  kilometer := self unit: #kilometer.
  self
    assert: ( degreeCelsius isCommensurableWith: kelvin );
    assert: degreeCelsius singularName equals: 'degree Celsius';
    assert: degreeCelsius pluralName equals: 'degrees Celsius';
    assert: degreeCelsius symbol equals: '°C';
    assert: degreeCelsius dimension equals: Dimension thermodynamicTemperature;
    assert: 0 * degreeCelsius equals: 27315 / 100 * kelvin;
    assert: ( 3 * degreeCelsius + ( 4 * degreeCelsius ) ) printString equals: '7 °C';
    assert: 23315 / 100 * kelvin equals: -40 * degreeCelsius;
    assert: ( 23315 / 100 * kelvin convertTo: degreeCelsius ) printString equals: '-40 °C';
    assert: 27315 / 100 * kelvin equals: 0 * degreeCelsius;
    assert: ( 27315 / 100 * kelvin convertTo: degreeCelsius ) printString equals: '0 °C';
    assert: 29315 / 100 * kelvin equals: 20 * degreeCelsius;
    assert: ( 29315 / 100 * kelvin convertTo: degreeCelsius ) printString equals: '20 °C';
    assert: 31015 / 100 * kelvin equals: 37 * degreeCelsius;
    assert: ( 31015 / 100 * kelvin convertTo: degreeCelsius ) printString equals: '37 °C';
    assert: 37315 / 100 * kelvin equals: 100 * degreeCelsius;
    assert: ( 37315 / 100 * kelvin convertTo: degreeCelsius ) printString equals: '100 °C'.

  self
    deny: ( 0 * degreeCelsius ) isZero;
    assert: ( -27315 / 100 * degreeCelsius ) isZero.

  self
    should: [ 0 * kilometer / degreeCelsius ] raise: ArithmeticError;
    should: [ kilometer / degreeCelsius ] raise: ArithmeticError.

  self
    assert: ( -40 * degreeCelsius convertTo: kelvin ) numericalValue equals: 23315 / 100;
    assert: ( 20 * degreeCelsius convertTo: kelvin ) numericalValue equals: 29315 / 100;
    assert: ( 37 * degreeCelsius convertTo: kelvin ) numericalValue equals: 31015 / 100;
    assert: ( 100 * degreeCelsius convertTo: kelvin ) numericalValue equals: 37315 / 100
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testFarad [

  | farad volt coulomb coulombPerVolt |
  volt := self unit: #volt.
  farad := self unit: #farad.
  coulomb := self unit: #coulomb.
  coulombPerVolt := coulomb / volt.
  self
    assert: ( farad isCommensurableWith: coulombPerVolt );
    assert: farad singularName equals: 'farad';
    assert: farad pluralName equals: 'farads';
    assert: farad symbol equals: 'F';
    assert: farad dimension equals: Dimension electricCurrent squared
      * ( Dimension time * Dimension time * Dimension time * Dimension time ) / Dimension mass
      / Dimension length squared;
    assert: 9 * farad equals: 9 * coulombPerVolt;
    assert: ( 5 * farad + ( 4 * farad ) ) printString equals: '9 F';
    assert: ( 5 * farad + ( 4 * coulombPerVolt ) ) printString equals: '9 F';
    assert: ( 4 * coulombPerVolt + ( 5 * farad ) ) printString equals: '9 A²·s⁴/kg·m²'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testHenry [

  | henry weber ampere weberPerAmpere |
  henry := self unit: #henry.
  weber := self unit: #weber.
  ampere := self unit: #ampere.
  weberPerAmpere := weber / ampere.
  self
    assert: ( henry isCommensurableWith: weberPerAmpere );
    assert: henry singularName equals: 'henry';
    assert: henry pluralName equals: 'henries';
    assert: henry symbol equals: 'H';
    assert: henry dimension
    equals: Dimension mass * Dimension length squared / Dimension time squared
      / Dimension electricCurrent squared;
    assert: 9 * henry equals: 9 * weberPerAmpere;
    assert: ( 3 * henry + ( 4 * henry ) ) printString equals: '7 H';
    assert: ( 3 * henry + ( 4 * weberPerAmpere ) ) printString equals: '7 H';
    assert: ( 4 * weberPerAmpere + ( 3 * henry ) ) printString equals: '7 kg·m²/s²·A²'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testHertz [

  | hertz second |
  hertz := self unit: #hertz.
  second := self unit: #second.
  self
    assert: ( hertz isCommensurableWith: second inverse );
    assert: hertz singularName equals: 'hertz';
    assert: hertz pluralName equals: 'hertz';
    assert: hertz symbol equals: 'Hz';
    assert: hertz dimension equals: Dimension time inverse;
    assert: 9 * hertz equals: 9 * second inverse;
    assert: ( 3 * hertz + ( 4 * hertz ) ) printString equals: '7 Hz';
    assert: ( 3 * hertz + ( 4 * second inverse ) ) printString equals: '7 Hz';
    assert: ( 4 * second inverse + ( 3 * hertz ) ) printString equals: '7 1/s'
]

{ #category : 'tests - information units' }
InternationalSystemOfUnitsTest >> testInformationUnitsConversion [

  | bit byte megabyte gigabyte terabit |
  bit := self unit: #bit.
  byte := self unit: #byte.
  megabyte := self unit: #megabyte.
  gigabyte := self unit: #gigabyte.
  terabit := self unit: #terabit.

  self
    assert: 8 * bit equals: 1 * byte;
    assert: 1 * megabyte equals: 1024 * 1024 * byte;
    assert: 1 * gigabyte equals: 1024 * megabyte;
    assert: 1 * terabit equals: 1024 / 8 * gigabyte.

  self
    assert: ( 4 * bit ) printString equals: '4 b';
    assert: ( 100 * ( self unit: #megabit ) / ( self unit: #second ) ) printString
    equals: '100 Mb/s';
    assert: ( 12 * megabyte / ( self unit: #second ) ) printString equals: '12 MB/s'.

  self
    assert: ( 32 * bit convertTo: byte ) equals: 4 * byte;
    assert: ( 32 * bit convertTo: byte ) printString equals: '4 B'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testJoule [

  | joule newton second newtonMeter |
  joule := self unit: #joule.
  newton := self unit: #newton.
  second := self unit: #meter.
  newtonMeter := newton * second.
  self
    assert: ( joule isCommensurableWith: newton * second );
    assert: joule singularName equals: 'joule';
    assert: joule pluralName equals: 'joules';
    assert: joule symbol equals: 'J';
    assert: joule dimension
    equals: Dimension mass * Dimension length squared * Dimension time squared inverse;
    assert: 9 * joule equals: 9 * newtonMeter;
    assert: ( 3 * joule + ( 4 * joule ) ) printString equals: '7 J';
    assert: ( 3 * joule + ( 4 * newtonMeter ) ) printString equals: '7 J';
    assert: ( 4 * newtonMeter + ( 3 * joule ) ) printString equals: '7 kg·m²/s²'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testLitre [

  | litre cubicDecimeter cubicCentimeter |
  litre := self unit: #litre.
  cubicDecimeter := ( self unit: #decimeter ) raisedToInteger: 3.
  cubicCentimeter := ( self unit: #centimeter ) raisedToInteger: 3.

  self
    assert: ( litre isCommensurableWith: cubicDecimeter );
    assert: litre singularName equals: 'litre';
    assert: litre pluralName equals: 'litres';
    assert: litre symbol equals: 'l';
    assert: litre dimension equals: Dimension length squared * Dimension length;
    assert: 9 * litre equals: 9 * cubicDecimeter;
    assert: ( 3 * litre + ( 4 * litre ) ) printString equals: '7 l';
    assert: ( 3 * litre + ( 4 * cubicDecimeter ) ) printString equals: '7 l';
    assert: ( 4 * cubicDecimeter + ( 3 * litre ) ) printString equals: '7 dm³';
    assert: 3 / 2 * litre equals: 1500 * cubicCentimeter;
    assert: 1 / 2 * litre equals: 500 * cubicCentimeter;
    assert: ( 3 / 2 * litre convertTo: cubicCentimeter ) printString equals: '1500 cm³';
    assert: ( 1 / 2 * litre convertTo: cubicCentimeter ) printString equals: '500 cm³'.

  self
    assert: 1 * ( self unit: #femtolitre )
    equals: 1 * ( ( self unit: #micrometer ) raisedToInteger: 3 );
    assert: 500 * ( self unit: #millilitre ) equals: 500 * cubicCentimeter;
    assert: 2 * ( self unit: #kilolitre ) equals: 2 * ( ( self unit: #meter ) raisedToInteger: 3 )
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testLumen [

  | lumen candela steradian candelaSteradian |
  lumen := self unit: #lumen.
  candela := self unit: #candela.
  steradian := self unit: #steradian.
  candelaSteradian := candela * steradian.
  self
    assert: ( lumen isCommensurableWith: candelaSteradian );
    assert: lumen singularName equals: 'lumen';
    assert: lumen pluralName equals: 'lumens';
    assert: lumen symbol equals: 'lm';
    assert: lumen dimension equals: Dimension luminousIntensity * Dimension angle squared;
    assert: 9 * lumen equals: 9 * candelaSteradian;
    assert: ( 3 * lumen + ( 4 * lumen ) ) printString equals: '7 lm';
    assert: ( 3 * lumen + ( 4 * candelaSteradian ) ) printString equals: '7 lm';
    assert: ( 4 * candelaSteradian + ( 3 * lumen ) ) printString equals: '7 rad²·cd'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testLux [

  | lux lumen meter lumenPerSquaredMeter |
  lux := self unit: #lux.
  lumen := self unit: #lumen.
  meter := self unit: #meter.
  lumenPerSquaredMeter := lumen / meter squared.
  self
    assert: ( lux isCommensurableWith: lumenPerSquaredMeter );
    assert: lux singularName equals: 'lux';
    assert: lux pluralName equals: 'lux';
    assert: lux symbol equals: 'lx';
    assert: lux dimension
    equals: Dimension luminousIntensity * Dimension angle squared / Dimension length squared;
    assert: 9 * lux equals: 9 * lumenPerSquaredMeter;
    assert: ( 3 * lux + ( 4 * lux ) ) printString equals: '7 lx';
    assert: ( 3 * lux + ( 4 * lumenPerSquaredMeter ) ) printString equals: '7 lx';
    assert: ( 4 * lumenPerSquaredMeter + ( 3 * lux ) ) printString equals: '7 rad²·cd/m²'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testNewton [

  | newton second kilogram meter kilogramMeterPerSquaredSecond |
  newton := self unit: #newton.
  second := self unit: #second.
  kilogram := self unit: #kilogram.
  meter := self unit: #meter.
  kilogramMeterPerSquaredSecond := kilogram * meter / second squared.

  self
    assert: ( newton isCommensurableWith: kilogramMeterPerSquaredSecond );
    assert: newton singularName equals: 'newton';
    assert: newton pluralName equals: 'newtons';
    assert: newton symbol equals: 'N';
    assert: newton dimension
    equals: Dimension mass * Dimension length * Dimension time squared inverse;
    assert: 9 * newton equals: 9 * kilogramMeterPerSquaredSecond;
    assert: ( 3 * newton + ( 4 * newton ) ) printString equals: '7 N';
    assert: ( 3 * newton + ( 4 * kilogramMeterPerSquaredSecond ) ) printString
    equals: '7 N';
    assert: ( 4 * kilogramMeterPerSquaredSecond + ( 3 * newton ) ) printString
    equals: '7 kg·m/s²'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testOhm [

  | ohm volt ampere voltPerAmpere |
  ohm := self unit: #ohm.
  volt := self unit: #volt.
  ampere := self unit: #ampere.
  voltPerAmpere := volt / ampere.
  self
    assert: ( ohm isCommensurableWith: voltPerAmpere );
    assert: ohm singularName equals: 'ohm';
    assert: ohm pluralName equals: 'ohms';
    assert: ohm symbol equals: 'Ω';
    assert: ohm dimension
    equals: Dimension mass * Dimension length squared / Dimension electricCurrent squared
      / ( Dimension time * Dimension time * Dimension time );
    assert: 9 * ohm equals: 9 * voltPerAmpere;
    assert: ( 5 * ohm + ( 4 * ohm ) ) printString equals: '9 Ω';
    assert: ( 5 * ohm + ( 4 * voltPerAmpere ) ) printString equals: '9 Ω';
    assert: ( 4 * voltPerAmpere + ( 5 * ohm ) ) printString equals: '9 kg·m²/s³·A²'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testPascal [

  | pascal newton meter newtonsPerSquaredMeter |
  pascal := self unit: #pascal.
  newton := self unit: #newton.
  meter := self unit: #meter.
  newtonsPerSquaredMeter := newton / meter squared.

  self
    assert: ( pascal isCommensurableWith: newtonsPerSquaredMeter );
    assert: pascal singularName equals: 'pascal';
    assert: pascal pluralName equals: 'pascals';
    assert: pascal symbol equals: 'Pa';
    assert: pascal dimension equals: Dimension mass / Dimension time squared / Dimension length;
    assert: 9 * pascal equals: 9 * newtonsPerSquaredMeter;
    assert: ( 3 * pascal + ( 4 * pascal ) ) printString equals: '7 Pa';
    assert: ( 3 * pascal + ( 4 * newtonsPerSquaredMeter ) ) printString equals: '7 Pa';
    assert: ( 4 * newtonsPerSquaredMeter + ( 3 * pascal ) ) printString equals: '7 kg/m·s²'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testSiemens [

  | siemens ohm |
  siemens := self unit: #siemens.
  ohm := self unit: #ohm.
  self
    assert: ( siemens isCommensurableWith: ohm inverse );
    assert: siemens singularName equals: 'siemens';
    assert: siemens pluralName equals: 'siemens';
    assert: siemens symbol equals: 'S';
    assert: siemens dimension
    equals:
      Dimension electricCurrent squared * ( Dimension time * Dimension time * Dimension time )
      / Dimension mass / Dimension length squared;
    assert: 9 * siemens equals: 9 * ohm inverse;
    assert: ( 5 * siemens + ( 4 * siemens ) ) printString equals: '9 S';
    assert: ( 5 * siemens + ( 4 * ohm inverse ) ) printString equals: '9 S';
    assert: ( 4 * ohm inverse + ( 5 * siemens ) ) printString equals: '9 s³·A²/kg·m²'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testTesla [

  | tesla weber meter weberPerSquaredMeter |
  tesla := self unit: #tesla.
  weber := self unit: #weber.
  meter := self unit: #meter.
  weberPerSquaredMeter := weber / meter squared.
  self
    assert: ( tesla isCommensurableWith: weberPerSquaredMeter );
    assert: tesla singularName equals: 'tesla';
    assert: tesla pluralName equals: 'teslas';
    assert: tesla symbol equals: 'T';
    assert: tesla dimension
    equals: Dimension mass / Dimension time squared / Dimension electricCurrent;
    assert: 9 * tesla equals: 9 * weberPerSquaredMeter;
    assert: ( 3 * tesla + ( 4 * tesla ) ) printString equals: '7 T';
    assert: ( 3 * tesla + ( 4 * weberPerSquaredMeter ) ) printString equals: '7 T';
    assert: ( 4 * weberPerSquaredMeter + ( 3 * tesla ) ) printString equals: '7 kg/s²·A'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testTimeUnits [

  self
    assertUnit: #second isCommensurableWith: #millisecond;
    assertUnit: #hour isCommensurableWith: #millisecond;
    assertUnit: #minute isCommensurableWith: #day;
    assertUnit: #day isCommensurableWith: #second;
    assertUnit: #second isCommensurableWith: #picosecond;
    assertUnit: #second isCommensurableWith: #yoctosecond;
    assertUnit: #second isCommensurableWith: #microsecond;
    assertUnit: #nanosecond isCommensurableWith: #millisecond;
    assertUnit: #second isCommensurableWith: #gigasecond;
    assertUnit: #second isCommensurableWith: #megasecond.

  self
    assert:
      ( self oneOf: #day ) + ( self oneOf: #hour ) + ( self oneOf: #minute )
      + ( self oneOf: #second ) + ( self oneOf: #gigasecond )
    equals: ( self unit: #second ) * 1000090061
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testVolt [

  | ampere volt watt wattPerAmpere |
  volt := self unit: #volt.
  ampere := self unit: #ampere.
  watt := self unit: #watt.
  wattPerAmpere := watt / ampere.
  self
    assert: ( volt isCommensurableWith: wattPerAmpere );
    assert: volt singularName equals: 'volt';
    assert: volt pluralName equals: 'volts';
    assert: volt symbol equals: 'V';
    assert: volt dimension
    equals: Dimension mass * Dimension length squared * Dimension electricCurrent inverse
      * ( Dimension time * Dimension time * Dimension time ) inverse;
    assert: 9 * volt equals: 9 * wattPerAmpere;
    assert: ( 5 * volt + ( 4 * volt ) ) printString equals: '9 V';
    assert: ( 5 * volt + ( 4 * wattPerAmpere ) ) printString equals: '9 V';
    assert: ( 4 * wattPerAmpere + ( 5 * volt ) ) printString equals: '9 kg·m²/s³·A'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testWatt [

  | joule watt second joulePerSecond |
  watt := self unit: #watt.
  joule := self unit: #joule.
  second := self unit: #second.
  joulePerSecond := joule / second.
  self
    assert: ( watt isCommensurableWith: joulePerSecond );
    assert: watt singularName equals: 'watt';
    assert: watt pluralName equals: 'watts';
    assert: watt symbol equals: 'W';
    assert: watt dimension equals: Dimension mass * Dimension length squared
      * ( Dimension time * Dimension time * Dimension time ) inverse;
    assert: 9 * watt equals: 9 * joulePerSecond;
    assert: ( 3 * watt + ( 4 * watt ) ) printString equals: '7 W';
    assert: ( 3 * watt + ( 4 * joulePerSecond ) ) printString equals: '7 W';
    assert: ( 4 * joulePerSecond + ( 3 * watt ) ) printString equals: '7 kg·m²/s³'
]

{ #category : 'tests' }
InternationalSystemOfUnitsTest >> testWeber [

  | weber volt second voltSecond |
  weber := self unit: #weber.
  volt := self unit: #volt.
  second := self unit: #second.
  voltSecond := volt * second.
  self
    assert: ( weber isCommensurableWith: voltSecond );
    assert: weber singularName equals: 'weber';
    assert: weber pluralName equals: 'webers';
    assert: weber symbol equals: 'Wb';
    assert: weber dimension
    equals:
      Dimension mass * Dimension length squared / Dimension time squared / Dimension electricCurrent;
    assert: 9 * weber equals: 9 * voltSecond;
    assert: ( 3 * weber + ( 4 * weber ) ) printString equals: '7 Wb';
    assert: ( 3 * weber + ( 4 * voltSecond ) ) printString equals: '7 Wb';
    assert: ( 4 * voltSecond + ( 3 * weber ) ) printString equals: '7 kg·m²/s²·A'
]

{ #category : 'private' }
InternationalSystemOfUnitsTest >> unit: unitSymbol [

  ^ InternationalSystemOfUnits units >> unitSymbol
]
