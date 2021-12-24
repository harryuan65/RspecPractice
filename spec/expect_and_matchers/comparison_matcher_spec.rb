RSpec.describe 'comparison matchers' do
  it 'allows for comparison with build-in Ruby operator' do
    expect(10).to be > 5
    expect(10).to be < 15
    expect(0).to be >= -1
  end

  describe 100 do # NOTE: if describing a instance or fixed value, subject is itself.
    it { is_expected.to be > 90 }
    it { is_expected.to be >= 100 }
    it { is_expected.not_to be > 200 }
  end
end
