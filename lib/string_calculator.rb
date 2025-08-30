class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    numbers.split(',').map(&:to_i).sum.to_i
  end
end
