RSpec.describe 25 do
  before(:all) do
    puts <<-DOC
      \e[33m Use #and to chain expectations
      \e[36m
        expect(subject).to be_odd
        expect(subject).to be > 20
        =>
        expect(subject).to be_odd\e[33m.and\e[36m be > 20
      \e[0m
    DOC
  end

  it 'can test for multiple matchers' do
    # expect(subject).to be_odd
    # expect(subject).to be > 20
    expect(subject).to be_odd.and be > 20
  end
end

RSpec.describe 'caterpillar' do
  it 'supports multiple matchers on a single line' do
    expect(subject).to start_with('cat').and end_with('pillar')
  end

  it { is_expected.to start_with('cat').and end_with('pillar') }
end

RSpec.describe [:japan, :singapore, :usa] do
  before(:all) do
    puts <<-DOC
      \e[33m When testing sampling possibilities, we can use #or to chain possible outcomes.
      \e[36m
        Business logic: result = [:japan, :singapore, :usa].sample
        expect(result).to ??? one of those
        =>
        expect(subject.sample).to eq(:usa)\e[33m.or\e[36m eq(:japan)\e[33m.or\e[36m eq(:singapore)
      \e[0m
    DOC
  end
  it 'can check for multiple possibilities' do
    expect(subject.sample).to eq(:usa).or eq(:japan).or eq(:singapore)
  end
end
