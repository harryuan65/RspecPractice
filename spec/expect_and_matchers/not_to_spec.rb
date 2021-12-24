RSpec.describe do
  it 'checks that two values do not match' do
    expect(5).not_to eq(3)
    expect('str').not_to eq('str2')
    expect([1, 2, 3]).not_to eq([2, 3])
  end
end
