RSpec.describe 'all matcher' do
  it 'allows for aggregate checks' do
    puts be_odd.class # RSpec::Matchers::BuiltIn::BePredicate
    expect([5, 7, 9]).to all(be_odd)
    expect([2, 4, 6, 8]).to all(be_even)
    expect([[], []]).to all(be_empty)
    expect([5, 7, 9]).to all(be < 10)
  end

  describe [5, 7, 9] do
    it { is_expected.to all(be > 2) }
    it { is_expected.to all(be_odd) }
  end
end
