# hard-coded Class Name
class King
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

RSpec.describe King do
  subject { described_class.new('Boris') }
  let(:louis) { described_class.new('louis') }

  before(:all) do
    puts <<-DOC
      \e[33m#described_class\e[0m can make the code flexible to changes.
      Say 'King ' will be changed to Royal but the interface is not, we can just change King to Royal and tests still runs
    DOC
  end

  it 'louis is one of them' do
    expect(louis.name).to eq('louis')
  end
end
