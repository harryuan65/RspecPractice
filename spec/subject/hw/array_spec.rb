RSpec.describe Array do
  it 'has length of 0' do
    expect(subject.length).to eq(0)
    subject.push('cat')
    expect(subject.length).to eq(1)
  end
  # it 'is true' do
  #   expect(true).to eq(true)
  # end
end
