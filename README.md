# amka-nim

![CI](https://github.com/zoispag/amka-nim/workflows/CI/badge.svg)

A validator for greek social security number (AMKA)

## Installation

```bash
nimble install amka
```

## Usage

Use the validator:

```nim
import amka

// An invalid AMKA
let (is_valid, err) = validate("09095986680")
echo is_valid # false

// An valid AMKA
let (is_valid, err) = validate("09095986684")
echo is_valid # true
```
