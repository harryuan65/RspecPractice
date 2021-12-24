RSpec.describe 'contain_exactly' do
  subject { [1, 2, 3] }
  before(:all) do
    puts <<-DOC
      \e[36mCheck elements without the ordering. If the ordering matters, use \e[33m#eq
      #contain_exactly\e[0m
    DOC
  end

  describe 'long form syntax' do
    it 'should check for the presence of all elements' do
      expect(subject).to contain_exactly(2, 3, 1)
      expect(subject).to contain_exactly(2, 1, 3)
      expect(subject).to contain_exactly(3, 2, 1)
      # expect(subject).to contain_exactly(3, 2) # fails
    end
  end

  it { is_expected.to contain_exactly(2, 3, 1) }
  it { is_expected.to contain_exactly(3, 1, 2) }
  it { is_expected.to contain_exactly(3, 2, 1) }
end
