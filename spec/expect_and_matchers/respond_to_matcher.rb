class HotChocolate
  def drink
    'Delicious'
  end

  def discard
    'PLOP'
  end

  def purchase(number)
    "I purchased #{number} hot chocolate beverages"
  end
end

class Coffee
  def drink; end
  def discard; end
  def purchase(number); end
end

RSpec.describe 'respond_to matcher' do
  before(:all) do
    puts <<-DOC
      \e[36m (Polymorphism): We care about WHAT IT CAN DO instead what it is.
        Whether the class has a /many method(s) ?
      \e[33m#respond_to?(*args)
      \e[0m
    DOC
  end

  describe HotChocolate do
    it 'should respond to #drink, #discard, #purchase' do
      expect(subject).to respond_to(:drink, :discard, :purchase)
    end

    it 'confirms an object respond to a method with arguments' do
      # #with already is "how many arguments". #arguments is optional
      expect(subject).to respond_to(:purchase).with(1).arguments
    end

    it { is_expected.to respond_to(:drink, :discard) }
    it { is_expected.to respond_to(:purchase).with(1).arguments }
  end

  describe Coffee do
    it 'should respond to #drink, #discard, #purchase' do
      expect(subject).to respond_to(:drink, :discard, :purchase)
    end
  end
end
