# frozen_string_literal: true

RSpec.describe 'math calculations' do
  it 'should do proper adding' do
    expect(101 + 99).to eq(200)
  end
  it 'should do proper subtracting' do
    expect(300 - 193).to eq(107)
  end
  it 'should do proper multipling' do
    expect(64 * 2).to eq(128)
  end
  it 'should do proper dividing' do
    expect(2048 / 2).to eq(1024)
  end
end
