# Aconcagua

![Logo](assets/logo.svg)

This model represents quantities as first class objects, that is, an object that
encapsulates a number with its unit.

[![Unit Tests](https://github.com/ba-st/Aconcagua/actions/workflows/unit-tests.yml/badge.svg)](https://github.com/ba-st/Aconcagua/actions/workflows/unit-tests.yml/badge.svg)
[![Coverage Status](https://codecov.io/github/ba-st/Aconcagua/coverage.svg?branch=release-candidate)](https://codecov.io/gh/ba-st/Aconcagua/branch/release-candidate)
[![Group loading check](https://github.com/ba-st/Aconcagua/actions/workflows/loading-groups.yml/badge.svg)](https://github.com/ba-st/Aconcagua/actions/workflows/loading-groups.yml)
[![Markdown Lint](https://github.com/ba-st/Aconcagua/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/ba-st/Aconcagua/actions/workflows/markdown-lint.yml)

[![GitHub release](https://img.shields.io/github/release/ba-st/Aconcagua.svg)](https://github.com/ba-st/Aconcagua/releases/latest)
[![Pharo 9.0](https://img.shields.io/badge/Pharo-9.0-informational)](https://pharo.org)
[![Pharo 10](https://img.shields.io/badge/Pharo-10-informational)](https://pharo.org)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-informational)](https://pharo.org)
[![Pharo 12](https://img.shields.io/badge/Pharo-12-informational)](https://pharo.org)

[![GS64 3.7.0](https://img.shields.io/badge/GS64-3.7.0-informational)](https://gemtalksystems.com/products/gs64/)
[![GS64 3.7.1](https://img.shields.io/badge/GS64-3.7.1-informational)](https://gemtalksystems.com/products/gs64/)

> *Named after [Aconcagua](https://en.wikipedia.org/wiki/Aconcagua), the highest
> mountain in both the southern and western hemispheres. It is located in the
> Andes, in the Mendoza Province, Argentina.*

This representation allows the programmer to use quantities in arithmetic
expressions as if they were numbers, but with the advantage of providing
explicit information to the system, specifically, the units.
See [Arithmetic with measurements on dynamically-typed object-oriented languages](http://dl.acm.org/citation.cfm?id=1094964)
or [download the article PDF](http://stephane.ducasse.free.fr/Teaching/CoursAnnecy/0506-M1-COO/aconcagua-p292-wilkinson.pdf)
for more about the original design of the project.

## Quick links

- [**Explore the docs**](docs/)
- [Report a defect](https://github.com/ba-st/Aconcagua/issues/new?labels=Type%3A+Defect)
- [Request a feature](https://github.com/ba-st/Aconcagua/issues/new?labels=Type%3A+Feature)

## Features

- Arithmetic Objects and Formulas: Summation and Product
- Discrete Intervals
- Integer superscript formatting
- Quantitative analysis
- Units and dimensions in the International System of Units
- US Customary Units support
- Units of account

## License

- The code is licensed under [MIT](LICENSE).
- The documentation is licensed under [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/).

## Installation

To load the project in a Pharo image, or declare it as a dependency of your own
project follow these [instructions](docs/Installation.md).

## Contributing

Check the [Contribution Guidelines](CONTRIBUTING.md)
