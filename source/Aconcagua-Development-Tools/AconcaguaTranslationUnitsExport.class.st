Class {
	#name : 'AconcaguaTranslationUnitsExport',
	#superclass : 'Object',
	#category : 'Aconcagua-Development-Tools',
	#package : 'Aconcagua-Development-Tools'
}

{ #category : 'examples' }
AconcaguaTranslationUnitsExport class >> dimensionStringsToTranslateByCategory [

  | stringsToTranslateByCategory |
  stringsToTranslateByCategory := OrderedDictionary new.
  stringsToTranslateByCategory
    at: 'Dimensions'
    put:
      ( { Dimension amountOfSubstance . Dimension electricCurrent . ( InternationalSystemOfUnits
              units >> #bit ) dimension . Dimension length . Dimension luminousIntensity .
          Dimension mass . Dimension angle . Dimension thermodynamicTemperature .
          Dimension time } inject: SortedCollection new into: [ :strings :dimension |
            strings
              add: dimension name;
              yourself
          ] ).
  ^ stringsToTranslateByCategory
]

{ #category : 'examples' }
AconcaguaTranslationUnitsExport class >> internationalUnitStringsToTranslateByCategory [

  | stringsToTranslateByCategory units |
  stringsToTranslateByCategory := OrderedDictionary new.
  units := InternationalSystemOfUnits units.
  stringsToTranslateByCategory
    at: 'SI Units'
    put: ( units names inject: SortedCollection new into: [ :strings :symbol |
            strings
              add: ( units >> symbol ) singularName;
              add: ( units >> symbol ) pluralName;
              yourself
          ] ).
  ^ stringsToTranslateByCategory
]

{ #category : 'examples' }
AconcaguaTranslationUnitsExport class >> run [

  <example>
  <ignoreForCoverage>
  | scanner |
  scanner := NaturalLanguageTranslationScanner forProjectNamed: 'Aconcagua'.
  scanner export.

  ( scanner repositoryLocalesDirectory / 'dimensions.json' )
    ensureCreateFile;
    writeStreamDo: [ :stream |
        scanner export: self dimensionStringsToTranslateByCategory on: stream ].

  ( scanner repositoryLocalesDirectory / 'units.json' )
    ensureCreateFile;
    writeStreamDo: [ :stream | scanner export: self internationalUnitStringsToTranslateByCategory on: stream ].

  ( scanner repositoryLocalesDirectory / 'us-units.json' )
    ensureCreateFile;
    writeStreamDo: [ :stream | scanner export: self usUnitStringsToTranslateByCategory on: stream ]
]

{ #category : 'examples' }
AconcaguaTranslationUnitsExport class >> usUnitStringsToTranslateByCategory [

  | stringsToTranslateByCategory units |
  stringsToTranslateByCategory := OrderedDictionary new.
  units := USCustomaryUnits units.
  stringsToTranslateByCategory
    at: 'US Units'
    put: ( units names inject: SortedCollection new into: [ :strings :symbol |
            strings
              add: ( units >> symbol ) singularName;
              add: ( units >> symbol ) pluralName;
              yourself
          ] ).
  ^ stringsToTranslateByCategory
]
