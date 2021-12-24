class ProgrammingLanguage
  attr_reader :name

  def initialize(name = 'Ruby')
    @name = name
  end
end

RSpec.describe ProgrammingLanguage do
  let(:language) { ProgrammingLanguage.new('Python') }

  it 'should store the name of the language' do
    expect(language.name).to eq('Python')
  end

  context 'with no argument' do
    # all nested level can access the language on Line 10, and we can overwrite it in certain level.
    let(:language) do
      ProgrammingLanguage.new
    end

    it 'should default to ruby' do
      expect(language.name).to eq('Ruby')
    end
  end
end
