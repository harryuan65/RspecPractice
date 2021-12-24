RSpec.describe 'be matcher' do
  before(:all) do
    puts <<-DOC
      \e[33m #be_truthy\e[0m, and \e[33m#be_falsey\e[0m
      \e[36m falsey: nil, false
      \e[34m truthy: all other values
    DOC
  end

  it 'can test for truthiness' do
    expect(0).to be_truthy
    expect(-1).to be_truthy
    expect(200).to be_truthy
    expect([]).to be_truthy
    expect({}).to be_truthy
    expect(StandardError).to be_truthy
  end

  it 'can test for falsiness' do
    expect(false).to be_falsey
    expect(nil).to be_falsey
  end

  it 'can test for nil' do
    expect(nil).to be_nil

    hash = { a: 3 }
    expect(hash[:b]).to be_nil # ruby predicate method #nil?
  end

  describe nil do
    it { is_expected.to be_nil }
  end
end
