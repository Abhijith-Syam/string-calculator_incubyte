class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    extract_operands_from_string(numbers).sum
  end

  private

  # Returns array of integers from a string of comma-separated numbers
  def extract_operands_from_string(argument_string)
    argument_string.split(',').map(&:to_i)
  end
end
