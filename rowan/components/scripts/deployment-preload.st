"GS64’s Number hierarchy features rigid object comparison logic. Type coercion
is only attempted if the target object responds to _isNumber with true.
However, because _isNumber is an inlined method, it cannot be overridden in
custom classes. We need to slightly patch these comparison methods to allow
symmetric evaluation between standard numbers and arithmetic formulas that
yield numeric values."

SmallInteger
compileMethod:
'~= aNumber

"Returns true if the receiver is not equal to aNumber;
 returns false otherwise.

 Should not be reimplemented.  The native code generator generates
 in-line implementations of SmallInteger>>~= . Reimplementations
 with different semantics than primitive 8 will not take effect
 unless native code is disabled."

<primitive: 8>
aNumber _isNumber ifTrue:[
  aNumber _isFloat ifTrue:[ ^ self asFloat ~= aNumber ].
  aNumber _isInteger ifTrue:[ ^ super ~= aNumber ].
   ^ self _retry: #~= coercing: aNumber
].
aNumber isNumber ifTrue:[
   ^ self _retry: #~= coercing: aNumber
].
^ true
'
  dictionaries: GsCurrentSession currentSession symbolList
  category: 'comparing';
compileMethod: '= aNumber

"Returns true if the receiver is equal to
 aNumber; returns false otherwise.

 Should not be reimplemented.  The native code generator generates
 in-line implementations of SmallInteger>>= . Reimplementations
 with different semantics than primitive 7 will not take effect
 unless native code is disabled."

<primitive: 7>
aNumber _isNumber ifTrue:[
  aNumber _isFloat ifTrue:[ ^ self asFloat = aNumber].
  aNumber _isInteger ifTrue:[ ^ super = aNumber ].
  ^ self _retry: #= coercing: aNumber
].
aNumber isNumber ifTrue: [^ self _retry: #= coercing: aNumber].
^ false'
  dictionaries: GsCurrentSession currentSession symbolList
  category: 'comparing'.

Integer
compileMethod:
'~= aNumber

"Returns true if the receiver is not equal to aNumber; returns false
 otherwise."

<primitive: 25>
aNumber _isFloat ifTrue:[ ^ self asFloat ~= aNumber ].
aNumber _isNumber ifTrue:[ ^ self _retry: #~= coercing: aNumber].
aNumber isNumber ifTrue:[ ^ self _retry: #~= coercing: aNumber].
^ true'
  dictionaries: GsCurrentSession currentSession symbolList
  category: 'comparing';
compileMethod:
'= aNumber

"Returns true if the receiver is equal to aNumber; returns false otherwise."

<primitive: 24>
aNumber _isFloat ifTrue:[ ^ self asFloat = aNumber ].
aNumber _isNumber ifTrue:[ ^ self _retry: #= coercing: aNumber].
aNumber isNumber ifTrue:[ ^ self _retry: #= coercing: aNumber].
^ false'
  dictionaries: GsCurrentSession currentSession symbolList
  category: 'comparing'.

AbstractFraction
compileMethod:
'= aNumber

"Returns true if the receiver is equal to aNumber; returns false otherwise."
(aNumber _isNumber or: [ aNumber isNumber ]) ifFalse:[ ^ false ].
(aNumber isKindOf: AbstractFraction ) ifTrue: [ | otherNum num |
  (otherNum := aNumber numerator) ifNil:[ ^ false ].
  (num := self numerator) ifNil:[ ^ false ].
  otherNum == 0 ifTrue: [
    ^ num == 0
  ].
  ^ otherNum = num and:[ aNumber denominator = self denominator ]
].
^ self _retry: #= coercing: aNumber'
  dictionaries: GsCurrentSession currentSession symbolList
  category: 'comparing'.

ScaledDecimal
compileMethod:
'= aNumber
| osc om m |
(aNumber _isNumber or: [ aNumber isNumber ]) ifFalse:[ ^ false ].
(m := self mantissa) ifNil:[ ^ false "self is a NaN"].
self == aNumber ifTrue:[ ^ true ].
aNumber _isScaledDecimal ifTrue:[
  osc := aNumber scale .  om := aNumber mantissa.
  om ifNil:[ ^ false ].
] ifFalse:[
  aNumber _isInteger ifTrue:[ osc := 0 .   om := aNumber ].
].
om ifNotNil:[ | sc |
  sc := self scale .
  sc == osc ifFalse:[
    sc > osc ifTrue:[ om := om * (10 raisedTo: sc - osc ) ]
            ifFalse:[ m := m * (10 raisedTo: osc - sc ) ].
  ].
  ^ m = om
].
^ self _retry: #= coercing: aNumber'
  dictionaries: GsCurrentSession currentSession symbolList
  category: 'comparing'.

FixedPoint
compileMethod:
'= aFixedPoint

self == aFixedPoint ifTrue:[ ^ true ].
aFixedPoint _isNumber ifFalse:[ ^ false ].
aFixedPoint isNumber ifFalse:[ ^ false ].
(aFixedPoint class == FixedPoint) ifTrue: [
  (aFixedPoint numerator = 0)
      ifTrue:[ ^ numerator = 0]
      ifFalse:[ ^ aFixedPoint numerator = numerator
                  and:[ aFixedPoint denominator = denominator ]].
].
^ self _retry: #= coercing: aFixedPoint'
  dictionaries: GsCurrentSession currentSession symbolList
  category: 'comparing'.
