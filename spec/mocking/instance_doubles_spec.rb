class Person
  def a(times)
    sleep(times) # complex operations, e.g. I/O
    'Hello'
  end
end

RSpec.describe Person do
  before(:all) do
    puts <<-DOC
      \e[33mMake sure your specs are always up to date when mocking.
      \e[36m#instance_double\e[0m
    DOC
  end
  describe 'regular double, which we CANT make sure it always matches the object we want to simulate' do
    it 'can implement any method' do
      person = double(a: 'Hello', b: 20)
      expect(person.a).to eq('Hello')
    end
  end

  describe 'instance double (verifying double)' do
    it 'can only implement methods that are defined on the class' do
      # person = instance_double(Person, a: 'Hello', b: 20)
      # This FAILS because the Person class does not implement the instance method: b
      # So, do we define actual b method? or fix the spec? => make code good for the long term.

      # person = instance_double(Person)
      # allow(person).to receive(:a).with(3, 10).and_return('Hello')
      # Wrong number of arguments. Expected 0, got 2.
      # instance double also checks the arity(# & type of arguments that the method expect)

      person = instance_double(Person)
      allow(person).to receive(:a).with(3).and_return('Hello')
    end
  end
end
