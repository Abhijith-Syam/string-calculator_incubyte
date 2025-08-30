class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, number_string = extract_delimiter_and_number_string(numbers)
    extract_operands_from_string(number_string, delimiter).sum
  end

  private

  # Returns array of integers from a string of comma-separated numbers
  def extract_operands_from_string(number_string, delimiter)
    number_string.split(delimiter).map(&:to_i)
  end

  # Returns the default or custom delimeter if any and the string containing the operand numbers
  def extract_delimiter_and_number_string(argument_string)
    number_string = argument_string
    delimiter = /[\n,]/
    if argument_string.start_with?("//")
      lines = argument_string.split("\n", 2)
      custom_delimiter = lines[0][2..-1]
      delimiter = /[\n,#{Regexp.escape(custom_delimiter)}]/
      number_string = lines[1]
    end

    [delimiter, number_string]
  end
end
