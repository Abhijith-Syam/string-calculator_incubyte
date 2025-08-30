class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    extract_operands_from_string(numbers).sum
  end

  private

  # Returns array of integers from a string of comma-separated numbers
  def extract_operands_from_string(argument_string)
    number_string = argument_string
    delimiter = /[\n,]/
    if argument_string.start_with?("//")
      lines = argument_string.split("\n", 2)
      custom_delimiter = lines[0][2..-1]
      delimiter = /[\n,#{Regexp.escape(custom_delimiter)}]/
      number_string = lines[1]
    end

    number_string.split(delimiter).map(&:to_i)
  end
end
