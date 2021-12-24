RSpec.describe 'before and after hooks' do
  # But context is just describe, so this hook runs only once for all tests below
  before(:context) do
    puts "\e[33m\e[1mBefore context!  \e[0m"
  end

  after(:context) do
    puts "\e[31m\e[1mAfter context!  \e[0m"
  end

  before(:example) do
    puts "\e[36m\e[1m Before example \e[0m"
  end

  after(:example) do
    puts "\e[31m\e[1m After example \e[0m"
  end

  context 'when number is 20' do
    it 'is just a random example' do
      puts '  20 is just 20'
      expect(20).to eq(20)
    end
    it 'is just a another random example' do
      puts '  20 is just 20'
      expect(20).to eq(20)
    end
  end

  context 'when number is 30' do
    it 'is just a another random example' do
      puts '  30 is just 30'
      expect(30).to eq(30)
    end
  end
end

# output:
# before and after hooks
# BEFORE!!
# 20 is just 20
# AFTER!
#   is just a random example
# BEFORE!!
# 20 is just 20
# AFTER!
#   is just a another random example
