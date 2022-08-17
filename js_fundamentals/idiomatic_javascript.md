# Idiomatic Javascript

__Naming conventions__ (legal vs idiomatic)

__Idiomatic names__ are the ones that follow the conventions established by the JS community:
  1. Most variables and functions, use camelCase: `speedOfLight`
  2. Classes and constructor functions, use PascalCase: `FlightLessBirds`
  3. Config values and magic constants, use SCREAMING_SNAKE_CASE: `ABSOLUTE_PATH`
  4. Other constants are flexible: either camelCase or SCREAMING_SNAKE_CASE

__Legal but Non-idiomatic names__ are those that do not follow idiomatic conventions but still work:
  1. Names that start or ends with `$` or `_`
       * Used by libraries and frameworks to avoid naming conflicts
  2. Names that violate the conventions around using camelCase or PascalCase


__Invalid names__:
  1. Begins with number
  2. Uses hyphen (-) or dot (.) 
