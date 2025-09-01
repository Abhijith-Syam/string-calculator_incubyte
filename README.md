# String Calculator Assessment @ Incubyte

A TDD implementation of a string calculator in Ruby.

## Requirements:

### The string calculator should:
- Return 0 for empty strings
- Handle single and multiple numbers
- Support comma and newline delimiters
- Allow custom delimiters
- Validate against negative numbers
- Ignore numbers greater than 1000

## Examples:

- Empty String: add("") → 0
- Single Operand: add("1") → 1
- Two Operands: add("1,2") → 3
- Multiple Operands: add("1,2,3,4") → 10
- New line present between operands: add("1\n2,3") # → 6
- Custom delimiter present between operands: add("//;\n1;2;3") # → 6
- Negative operand present: add("1,-2,-3") # → Error: "Negative numbers not allowed: -2, -3"