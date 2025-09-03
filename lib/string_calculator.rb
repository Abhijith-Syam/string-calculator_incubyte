class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    custom_delimiter = numbers.start_with?("//")

    delimiter, number_string = extract_delimiter_and_number_string(numbers)
    operands = operands_from_string(number_string, delimiter)
    validate_operands(operands)

    return multiplied_result(number_string) if multiplication_operand_present?(number_string) && !custom_delimiter

    operands.sum
  end

  private

  def multiplied_result(numbers)
    result = 1
    numbers.split('*').each do |n|
      result = result * n.to_i
    end
    result
  end

  def multiplication_operand_present?(numbers)
    numbers.split(',').select { |n| n.include?('*') }.length > 0
  end

  # Returns array of integers from a string of comma-separated numbers, skips numbers greater than 1000
  def operands_from_string(number_string, delimiter)
    number_string.split(delimiter).map(&:to_i).select { |n| n < 1000 }
  end

  # Returns the default or custom delimeter if any and the string containing the operand numbers
  def extract_delimiter_and_number_string(argument_string)
    return [/[\n,]/, argument_string] unless argument_string.start_with?("//")

    lines = argument_string.split("\n", 2)
    custom_delimiter = lines[0][2..-1]

    [/[\n,#{Regexp.escape(custom_delimiter)}]/, lines[1]]
  end

  # Validates for negative operands
  def validate_operands(operands)
    negative_operands = operands.select { |n| n < 0 }

    raise "negative numbers not allowed #{negative_operands.join(',')}" unless negative_operands.empty?
  end
end
