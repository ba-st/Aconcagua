"
An UnitOfMeasureTest is a test class for testing the behavior of UnitOfMeasure
"
Class {
	#name : 'UnitOfMeasureTest',
	#superclass : 'TestCase',
	#instVars : [
		'meter',
		'second',
		'centimeter'
	],
	#category : 'Aconcagua-Quantitative-Analysis-Tests',
	#package : 'Aconcagua-Quantitative-Analysis-Tests'
}

{ #category : 'running' }
UnitOfMeasureTest >> setUp [

  super setUp.
  meter := BaseUnitOfMeasure
             basedOn: Dimension length
             singularNamed: 'meter'
             pluralNamed: 'meters'
             symbol: 'm'.
  centimeter := MultipleUnitOfMeasure
                  basedOn: meter
                  prefixedBy: 'centi'
                  symbolPrefixedBy: 'c'
                  raisedTo: -2.
  second := BaseUnitOfMeasure
              basedOn: Dimension time
              singularNamed: 'second'
              pluralNamed: 'seconds'
              symbol: 's'
]

{ #category : 'tests' }
UnitOfMeasureTest >> testAccessing [

  self
    assert: meter printString equals: 'm';
    assert: meter singularName equals: 'meter';
    assert: meter pluralName equals: 'meters';
    assert: meter symbol equals: 'm';
    assert: centimeter printString equals: 'cm';
    assert: centimeter singularName equals: 'centimeter';
    assert: centimeter pluralName equals: 'centimeters';
    assert: centimeter symbol equals: 'cm'
]

{ #category : 'tests' }
UnitOfMeasureTest >> testCommensurability [

  self
    assert: ( meter isCommensurableWith: meter );
    assert: ( meter isCommensurableWith: centimeter );
    deny: ( meter isCommensurableWith: second );
    deny: ( second isCommensurableWith: meter )
]

{ #category : 'tests' }
UnitOfMeasureTest >> testComparison [

  self
    assert: meter equals: meter;
    assert: meter hash equals: meter hash;
    assert: meter * meter equals: meter * meter;
    assert: ( meter * meter ) hash equals: ( meter * meter ) hash;
    assert: meter * second equals: second * meter;
    assert: ( meter * second ) hash equals: ( second * meter ) hash
]

{ #category : 'tests' }
UnitOfMeasureTest >> testDivision [

  self
    assert: ( meter / meter ) printString equals: '';
    assert: ( meter / meter ) isDimensionless;
    assert: ( meter / second ) printString equals: 'm/s';
    assert: ( meter * meter / centimeter ) printString equals: 'm²/cm'
]

{ #category : 'tests' }
UnitOfMeasureTest >> testInverse [

  self
    assert: meter inverse symbol equals: '1/m';
    assert: meter inverse printString equals: '1/m';
    assert: meter inverse dimension equals: Dimension length inverse.

  self
    assert: ( meter * meter ) inverse symbol equals: '1/m²';
    assert: ( meter * meter ) inverse dimension
    equals: ( Dimension length * Dimension length ) inverse.

  self
    assert: ( meter * centimeter * second ) inverse symbol equals: '1/m·cm·s';
    assert: ( meter * centimeter * second ) inverse dimension
    equals: ( Dimension length squared * Dimension time ) inverse.

  self
    assert: ( meter * meter * second inverse ) symbol equals: 'm²/s';
    assert: ( meter * meter * second inverse ) dimension
    equals: Dimension length squared / Dimension time.

  self
    assert: ( meter inverse * second inverse ) symbol equals: '1/m·s';
    assert: ( meter inverse * second inverse ) dimension
    equals: Dimension length inverse / Dimension time.

  self
    assert: ( meter * meter inverse ) symbol equals: '';
    assert: ( meter * meter inverse ) isDimensionless.

  self
    assert: ( meter * meter * meter inverse ) symbol equals: 'm';
    assert: ( meter * meter * meter inverse ) dimension equals: Dimension length
]

{ #category : 'tests' }
UnitOfMeasureTest >> testMultiplication [

  self
    assert: ( meter * meter ) printString equals: 'm²';
    assert: ( centimeter * centimeter ) printString equals: 'cm²';
    assert: ( meter * meter * centimeter ) printString equals: 'm²·cm';
    assert: ( meter * meter * second ) printString equals: 'm²·s';
    assert: meter * ( 1 * meter ) equals: 1 * (meter * meter)
]

{ #category : 'tests' }
UnitOfMeasureTest >> testRaisedToInteger [

  self
    assert: ( meter raisedToInteger: 2 ) equals: meter * meter;
    assert: ( meter raisedToInteger: 3 ) equals: meter * meter * meter;
    assert: ( meter raisedToInteger: 1 ) equals: meter;
    assert: ( meter raisedToInteger: -1 ) equals: meter inverse;
    assert: ( meter * meter raisedToInteger: 3 )
    equals: meter * meter * meter * meter * meter * meter;
    assert: ( meter * meter raisedToInteger: -1 ) equals: ( meter raisedToInteger: 2 ) inverse;
    assert: ( centimeter raisedToInteger: 2 ) equals: centimeter * centimeter;
    assert: ( centimeter raisedToInteger: -1 ) equals: centimeter inverse
]
