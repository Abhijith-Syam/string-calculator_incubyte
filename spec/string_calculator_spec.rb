require 'spec_helper'

RSpec.describe StringCalculator do

  describe '#add' do

    it 'returns 0 for an empty string' do
      calculator = StringCalculator.new

      expect(calculator.add("")).to eq(0)
    end

    it 'returns the number when only one number is passed' do
      calculator = StringCalculator.new

      expect(calculator.add("1")).to eq(1)
    end

    it 'returns the sum if two numbers are passed' do
      calculator = StringCalculator.new

      expect(calculator.add("1,5")).to eq(6)
    end

    it 'returns the sum if multiple numbers are passed' do
      calculator = StringCalculator.new

      expect(calculator.add("1,5,8")).to eq(14)
    end

    it 'returns the sum if new lines between numbers' do
      calculator = StringCalculator.new

      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'returns the sum if custom delimiter between numbers' do
      calculator = StringCalculator.new

      expect(calculator.add("//;\n1;2")).to eq(3)
    end
  end
end
