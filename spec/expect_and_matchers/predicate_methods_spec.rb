RSpec.describe 'predicate' do
  it 'can be tested with plain ruby methods' do
    result = 16 / 2
    expect(result.even?).to eq(true)
  end

  it 'can be tested with predicate matchers' do
    expect(16 / 2).to be_even  # be_PREDICATE_METHOD
    expect(0).to be_zero       # be_PREDICATE_METHOD
    expect([]).to be_empty     # be_PREDICATE_METHOD
    # be_even => finds even?
    # be_odd  => finds odd?
    # be_empty => finds empty?
  end

  describe 0 do
    it { is_expected.to be_zero }
  end
end
