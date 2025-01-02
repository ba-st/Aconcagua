# Arithmetic

## Arithmetic Object

An `ArithmeticObject` is an abstract class declaring the common behavior for
arithmetic objects:

- Fundamental math operations: addition, subtraction, multiplication and division
- Exponentiation

## Arithmetic Formula

An `ArithmeticFormula` is a mathematical expression that involves arithmetic
operations like addition, subtraction, multiplication, and division.

It typically describes a relationship between numbers, variables, or both, and
is used to perform calculations.

Concrete subclasses provide specific calculations.

## Summation

A `Summation` is the addition of a finite sequence of numbers or arithmetic objects,
called addends or summands; the result is their sum or total.

Besides numbers, other types of values can be summed as well: functions, vectors,
matrices, polynomials and, in general, elements of any type of mathematical objects
on which an operation denoted "`+`" is defined.

For example:

```smalltalk
(Summation of: [:i | i squared] from: 1 to: 4) = (1 + 4 + 9 + 16)
```

```smalltalk
(Summation ofAll: #(1 2 3 4)) = (1 + 2 + 3 + 4)
```

```smalltalk
(Summation ofAll: #(1 2 3 4) applying: #squared) = (1 + 4 + 9 + 16)
```

## Sequence Product

A `SequenceProduct` (or finite product) is the multiplication of a finite sequence
of numbers or arithmetic objects, called factors; the result is their product.

Besides numbers, other types of values can be multiplied as well: functions,
vectors, matrices, polynomials and, in general,
elements of any type of mathematical objects on
which an operation denoted "`×`" is defined.

For example:

```smalltalk
(SequenceProduct of: [:i | i ] from: 1 to: 4) = 4 factorial
```

```smalltalk
(SequenceProduct ofAll: #(1 2 3 4)) = 4 factorial
```

```smalltalk
(SequenceProduct ofAll: #(1 2 3 4) applying: #squared) = (4 * 9 * 16)
```

## Discrete Interval

A discrete interval is a finite set of discrete values that lie within certain bounds,
usually taken from the set of integers or some other countable set.

This implementation can be used with any arithmetic objects as the values, not
only numbers.

## Superscript formatting

An `IntegerAsSuperscriptFormatter` is a formatter that can convert
any integer to its superscript form. Useful when printing exponents.

For example:

```smalltalk
( IntegerAsSuperscriptFormatter new format: -10 ) >>> '⁻¹⁰'
```

```smalltalk
( IntegerAsSuperscriptFormatter new format: 1234 ) >>> '¹²³⁴'
```
