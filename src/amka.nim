import strutils
import times

proc validate*(amka: string): (bool, string) =
  ## Validates the given string for AMKA

  try:
    discard amka.parseFloat()
  except ValueError:
    return (false, "Provided AMKA is not a numeric value")

  if len(amka) != 11:
    return (false, "Provided number is not 11 digits long")

  try:
    discard parse(amka[0..5], "ddMMyy")
  except TimeParseError:
    return (false, "First 6 digits of the provided AMKA do not represent a valid date")

  const m = [0, 2, 4, 6, 8, 1, 3, 5, 7, 9]
  var sum = 0
  var odd = true
  for i in countdown(amka.high, 0):
    let digit = ord(amka[i]) - ord('0')
    sum += (if odd: digit else: m[digit])
    odd = not odd
  let valid_check_digit = sum mod 10 == 0;

  if not valid_check_digit:
    return (false, "Provided AMKA does not have a valid checkdigit")

  return (true, "")
