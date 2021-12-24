RSpec.describe Hash do
  subject do
    {
      name: 'harry',
      position: 'Ruby on Rails developer'
    }
  end

  it 'has tow k-v pairs' do
    expect(subject.length).to eq(2)
  end
end
