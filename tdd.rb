class Calculator
  def add(a,b)
    a+b
  end
end

describe Calculator do
  describe '#add' do
    it 'adds two numbers' do
      calculator = Calculator.new
      result = calculator.add(3,5)
      expect(result).to eq(8)
    end
  end
end