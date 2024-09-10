Class {
	#name : #CompoundingFormula,
	#superclass : #Object,
	#instVars : [
		'presentValue',
		'nominalRate',
		'timeUnits',
		'periods'
	],
	#category : #'Aconcagua-Core-MeasureModel'
}

{ #category : #calculating }
CompoundingFormula >> calculate [
	
	| exponent parenthesized |
	exponent := self periods * self timeUnits.
	parenthesized := 1 + (self nominalRate / self periods).
	^ self presentValue * (parenthesized raisedTo: exponent)
]

{ #category : #accessing }
CompoundingFormula >> nominalRate [
	^ nominalRate
]

{ #category : #accessing }
CompoundingFormula >> nominalRate: anObject [
	nominalRate := anObject
]

{ #category : #accessing }
CompoundingFormula >> periods [
	^ periods ifNil: [ 1 ]
]

{ #category : #accessing }
CompoundingFormula >> periods: anObject [
	periods := anObject
]

{ #category : #accessing }
CompoundingFormula >> presentValue [
	^ presentValue
]

{ #category : #accessing }
CompoundingFormula >> presentValue: anObject [
	presentValue := anObject
]

{ #category : #accessing }
CompoundingFormula >> timeUnits [
	^ timeUnits
]

{ #category : #accessing }
CompoundingFormula >> timeUnits: anObject [
	timeUnits := anObject
]
