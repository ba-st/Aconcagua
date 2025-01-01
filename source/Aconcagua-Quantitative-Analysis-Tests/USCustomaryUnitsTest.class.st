"
An USCustomaryUnitsTest is a test class for testing the behavior of USCustomaryUnits
"
Class {
	#name : 'USCustomaryUnitsTest',
	#superclass : 'TestCase',
	#category : 'Aconcagua-Quantitative-Analysis-Tests',
	#package : 'Aconcagua-Quantitative-Analysis-Tests'
}

{ #category : 'tests' }
USCustomaryUnitsTest >> testDryVolumeUnits [

  self
    assert: 1 * ( self unit: #dryPint )
    equals: 55061047135749 / ( 10 raisedTo: 14 ) * ( self unit: #litre );
    assert: 1 * ( self unit: #dryQuart ) equals: 2 * ( self unit: #dryPint );
    assert: 1 * ( self unit: #dryGallon ) equals: 4 * ( self unit: #dryQuart );
    assert: 1 * ( self unit: #peck ) equals: 2 * ( self unit: #dryGallon );
    assert: 1 * ( self unit: #bushel ) equals: 4 * ( self unit: #peck );
    assert: 1 * ( self unit: #dryBarrel ) equals: 2625 / 100 * ( self unit: #dryGallon )
]

{ #category : 'tests' }
USCustomaryUnitsTest >> testFluidVolumeUnits [

  self
    assert: 1 * ( self unit: #teaspoon )
    equals: 492892159375 / ( 10 raisedTo: 11 ) * ( self unit: #millilitre );
    assert: 1 * ( self unit: #tablespoon ) equals: 3 * ( self unit: #teaspoon );
    assert: 1 * ( self unit: #fluidOunce ) equals: 2 * ( self unit: #tablespoon );
    assert: 1 * ( self unit: #shot ) equals: 3 * ( self unit: #tablespoon );
    assert: 1 * ( self unit: #gill ) equals: 4 * ( self unit: #fluidOunce );
    assert: 1 * ( self unit: #cup ) equals: 2 * ( self unit: #gill );
    assert: 1 * ( self unit: #cup ) equals: 8 * ( self unit: #fluidOunce );
    assert: 1 * ( self unit: #fluidPint ) equals: 2 * ( self unit: #cup );
    assert: 1 * ( self unit: #fluidQuart ) equals: 2 * ( self unit: #fluidPint );
    assert: 1 * ( self unit: #pottle ) equals: 2 * ( self unit: #fluidQuart );
    assert: 1 * ( self unit: #fluidGallon ) equals: 4 * ( self unit: #fluidQuart );
    assert: 1 * ( self unit: #fluidBarrel ) equals: 315 / 10 * ( self unit: #fluidGallon );
    assert: 1 * ( self unit: #oilBarrel ) equals: 42 * ( self unit: #fluidGallon );
    assert: 1 * ( self unit: #hogshead ) equals: 63 * ( self unit: #fluidGallon )
]

{ #category : 'tests' }
USCustomaryUnitsTest >> testLenghtUnits [

  self
    assert: 1 * ( self unit: #point ) equals: 1 / 72 * ( self unit: #inch );
    assert: 1 * ( self unit: #pica ) equals: 12 * ( self unit: #point );
    assert: 1 * ( self unit: #inch ) equals: 254 / 10 * ( self unit: #millimeter );
    assert: 1 * ( self unit: #foot ) equals: 12 * ( self unit: #inch );
    assert: 1 * ( self unit: #yard ) equals: 3 * ( self unit: #foot );
    assert: 1 * ( self unit: #mile ) equals: 1760 * ( self unit: #yard );
    assert: 1 * ( self unit: #league ) equals: 3 * ( self unit: #mile )
]

{ #category : 'tests' }
USCustomaryUnitsTest >> testMassUnits [

  self
    assert: 1 * ( self unit: #grain )
    equals: 6479891 / ( 10 raisedTo: 5 ) * ( self unit: #milligram );
    assert: 1 * ( self unit: #dram ) equals: 1 / 16 * ( self unit: #ounce );
    assert: 1 * ( self unit: #ounce ) equals: 1 / 16 * ( self unit: #pound );
    assert: 1 * ( self unit: #pound ) equals: 45359237 / 100000 * ( self unit: #gram );
    assert: 1 * ( self unit: #shortHundredweight ) equals: 100 * ( self unit: #pound );
    assert: 1 * ( self unit: #longHundredweight ) equals: 112 * ( self unit: #pound );
    assert: 1 * ( self unit: #shortTon ) equals: 20 * ( self unit: #shortHundredweight );
    assert: 1 * ( self unit: #longTon ) equals: 20 * ( self unit: #longHundredweight );
    assert: 1 * ( self unit: #pennyweight ) equals: 24 * ( self unit: #grain );
    assert: 1 * ( self unit: #troyOunce ) equals: 20 * ( self unit: #pennyweight );
    assert: 1 * ( self unit: #troyPound ) equals: 12 * ( self unit: #troyOunce )
]

{ #category : 'private' }
USCustomaryUnitsTest >> unit: unitSymbol [

  ^ USCustomaryUnits units
      at: unitSymbol
      ifAbsent: [ InternationalSystemOfUnits units >> unitSymbol ]
]
