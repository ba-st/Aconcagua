"
A base dimension is a fundamental dimension.
"
Class {
	#name : 'BaseDimension',
	#superclass : 'Dimension',
	#category : 'Aconcagua-Quantitative-Analysis',
	#package : 'Aconcagua-Quantitative-Analysis'
}

{ #category : 'testing' }
BaseDimension class >> isAbstract [

  <ignoreForCoverage>
  ^ self = BaseDimension
]

{ #category : 'arithmetic' }
BaseDimension >> * aDimension [

  ^ self = aDimension
      then: [ DerivedDimension from: self raisedTo: 2 ]
      otherwise: [ aDimension productWithBaseDimension: self ]
]

{ #category : 'arithmetic' }
BaseDimension >> inverse [

  ^ DerivedDimension from: self raisedTo: -1
]

{ #category : 'testing' }
BaseDimension >> isDimensionless [

  ^ false
]

{ #category : 'private' }
BaseDimension >> productWithBaseDimension: baseDimention [

  ^ DerivedDimension from: self and: baseDimention
]

{ #category : 'private' }
BaseDimension >> productWithDerivedDimension: aDerivedDimension [

  ^ aDerivedDimension productWithBaseDimension: self
]
