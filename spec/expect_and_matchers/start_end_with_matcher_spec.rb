RSpec.describe 'start_with and end_with matcher' do
  before(:all) do
    puts <<-DOC
      \e[36m String or Array can use (Note: case sensitive):\e[33m
      #start_with(*arg)
      #end_with(*arg)
      \e[0m
    DOC
  end

  describe 'caterpillar' do
    it 'should check for substring at the beginning' do
      expect(subject).to start_with('cat')
    end

    it 'should check for substring at the end' do
      expect(subject).to end_with('lar')
    end

    it { is_expected.to start_with('cate') }
    it { is_expected.to end_with('ar') }
  end

  describe [:a, :b, :c, :d] do
    it 'should check for elements at beginning or end of the array' do
      expect(subject).to start_with(:a)
      expect(subject).to start_with(:a, :b, :c)
      expect(subject).to end_with(:d)
      expect(subject).to end_with(:c, :d)
    end

    it { is_expected.to start_with(:a, :b) }
    it { is_expected.to end_with(:d) }
  end
end
