RSpec.describe 'before and after hooks' do
  before(:example) do
    puts 'BEFORE!!'
  end

  after(:example) do
    puts 'AFTER!'
  end

  it 'is just a random example' do
    puts '20 is just 20'
    expect(20).to eq(20)
  end

  it 'is just a another random example' do
    puts '20 is just 20'
    expect(20).to eq(20)
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
