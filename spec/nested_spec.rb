RSpec.describe 'nested' do
  before(:context) do
    puts 'OUT before context'
  end

  before(:example) do
    puts 'OUT before example'
  end

  it 'does math' do
    expect(1 + 1).to eq(2)
  end

  context 'with condition A' do
    before(:context) do
      puts 'INNER before context'
    end

    before(:example) do
      puts 'INNER before example' # outer will run first
    end

    it 'does more math' do
      expect(1 + 3).to eq(4)
    end
  end
end
