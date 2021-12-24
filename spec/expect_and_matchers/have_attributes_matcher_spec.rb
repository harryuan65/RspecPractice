class ProfessionalWrestler
  attr_reader :name, :finishing_move

  def initialize(name, finishing_move)
    @name = name
    @finishing_move = finishing_move
  end
end

RSpec.describe 'have_attribute matcher' do
  describe ProfessionalWrestler.new('Stone Cold Steve Austin', 'Stunner') do
    it 'checks for object attribute and proper values' do
      expect(subject).to have_attributes(name: 'Stone Cold Steve Austin') # hash, but if it is the last hash passed in, you dont need curly braces.
      expect(subject).to have_attributes(finishing_move: 'Stunner')
      expect(subject).to have_attributes(name: 'Stone Cold Steve Austin', finishing_move: 'Stunner')
    end

    it { is_expected.to have_attributes(name: 'Stone Cold Steve Austin') }
    it { is_expected.to have_attributes(finishing_move: 'Stunner') }
    it { is_expected.to have_attributes(name: 'Stone Cold Steve Austin', finishing_move: 'Stunner') }
  end
end
