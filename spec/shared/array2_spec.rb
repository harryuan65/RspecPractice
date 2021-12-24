RSpec.describe Array do
  subject(:sally) { %w[harry hazel] }

  it 'subject should have length of 2' do
    expect(subject.length).to eq(2)
    subject.pop
    expect(subject.length).to eq(1)
  end

  it 'sally should be the same' do
    expect(sally).to eq(sally)
  end

  it 'sally should be the same' do
    expect(sally).to eq(%w[harry hazel])
  end
end
