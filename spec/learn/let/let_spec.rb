# frozen_string_literal: true

User = Struct.new(:name, :age)

RSpec.describe 'let' do
  let(:user) do
    puts Rainbow('Generating a user').yellow.bright.underline
    User.new('harry', 25)
  end

  it 'is cached in the same example in the SAME SCOPE' do
    expect(user.age).to eq(25)
    user.age = 26
    expect(user.age).to eq(26)
  end

  it 'is cached in the same example in the SAME SCOPE' do
    expect(user.age).to eq(25)
  end
end

# bundle exec rspec spec/learn/let/let_spec.rb:23 Fails
RSpec.describe 'let#2' do
  before(:all) do
    puts Rainbow('Loop through names array to see if initializing with loop works').yellow.bright.underline
  end

  %w[harry jack hazel].each_with_index do |name, i|
    let(:user) do
      puts Rainbow('Generating a user').yellow.bright.underline
      puts Rainbow("i is #{i}").red # always 1
      User.new(name, 25) # Fails: always got name = harry
    end

    it "should be #{name}" do # harry jack
      puts 'running first example...'
      expect(user.name).to eq(name) # Fails because let captures
    end

    it 'is cached in the same example in the SAME SCOPE' do
      puts 'running second example...'
      expect(user.age).to eq(25)
    end
  end
end

# bundle exec rspec spec/learn/let/let_spec.rb:48
RSpec.describe 'let#3' do
  before(:all) do
    puts Rainbow('Loop through names array to see if initializing with loop works').yellow.bright.underline
  end

  %w[harry jack].each_with_index do |name, i|
    # I think let#2 fails because "it"s are not in a single context/describe, runs only after loop completes
    context "name is #{name}" do
      let(:user) do
        puts Rainbow('Generating a user').yellow.bright.underline
        puts Rainbow("i is #{i}").red
        User.new(name, 25)
      end

      it "should be #{name}" do
        expect(user.name).to eq(name)
      end

      it 'is cached in the same example in the SAME SCOPE' do
        expect(user.age).to eq(25)
      end
    end
  end
end
