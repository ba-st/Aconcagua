"
I'm here only to mediate the required initialization between well known dimensions and units.
The initialization of this well known objects requires an specific order to work properly.
"
Class {
	#name : 'AconcaguaQuantitativeAnalysisInitialization',
	#superclass : 'Object',
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'class initialization' }
AconcaguaQuantitativeAnalysisInitialization class >> initialize [

  <ignoreForCoverage>
  EscapingAlgorithm initialize.
  NaturalLanguageTranslator current ifNil: [
      NaturalLanguageTranslator current: PolyglotNaturalLanguageTranslator new ].
  Dimension initializeDimensions.
  InternationalSystemOfUnits initializeUnits.
  USCustomaryUnits initializeUnits
]
