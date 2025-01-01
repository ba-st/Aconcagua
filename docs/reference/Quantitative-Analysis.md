# Quantitative Analysis

## Dimensions

In dimensional analysis, a dimension refers to a fundamental physical property
that can be expressed in terms of basic quantities.

Each physical quantity can be described by a combination of dimensions, which
are typically represented using these base quantities.

This library includes the 7 base dimensions as defined in the
International System of Units (SI), time, thermodynamic temperature,
length, mass, electric current, amount of substance and
luminous intensity. It also includes plane angle as a base
dimension as suggested in _"Angles in the SI: a detailed proposal for solving
the problem by Paul Quincey"_

For a more nuanced analysis see "The International System of Units (SI)" published
by the NIST and the ISO 80000 reference.

Base dimensions can be combined using multiplication or division to
create a derived dimension. For example volumes are measured in a three-dimensional
space whose dimension is L³.

## Quantities and units

The value of a quantity is generally expressed as the product of a number and a unit.
The unit is simply a particular example of the quantity concerned which is used
as a reference, and the number is the ratio of the value of the quantity to the unit.
For a particular quantity, many different units may be used.

In the library to create a quantity we just multiply a number and a unit:

```smalltalk
| meter |
meter := SI >> #meter.
15 * meter squared "15 m²"
```

`SI` is a namespace containing the units defined in the International System of Units.
US Customary Units are also easily accessed by sending messages to `USCustomaryUnits`.

Quantities can be compared in terms of "more", "less", or "equal", or by
assigning a numerical value multiple of a unit of measurement. Mass, time, distance,
heat, and angle are among the familiar examples of quantitative properties.

Quantities are arithmetic objects, and as such supports the usual arithmetic operations.

Addition and subtraction are only supported for quantities that are commensurable.
A quantity is commensurable if its units are also commensurable. Two units are
commensurable if they belong to the same dimension.

Product and division are supported even for non-commensurable quantities, because
dimension multiplication and division are also defined.

Quantities can also be converted to a different unit, given that
both the current and the target units are commensurable.

For example:

```smalltalk
| meter centimeter inch |
meter := SI >> #meter.
centimeter := SI >> #centimeter.
inch := USCustomaryUnits units >> #inch.
(1 * meter) convertTo: centimeter. "100 cm"
(1 * inch) convertTo: centimeter "2.54 cm"
```

### Units of Account

A unit of account is a standard numerical unit of measurement that provides a consistent
measure of value for goods, services, and assets. It is one of the three primary
functions
of money, alongside being a medium of exchange and a store of value.

Any object can be used as a reference for a unit of account:

```smalltalk
usdt := UnitOfAccount on: 'USDT' symbol: '₮'
```

Quantities including units of account are commensurable only if the units of account
are the same. They can be combined with units of measure:

```smalltalk
1000 * usdt / meter squared "1000 ₮/m²"
```
