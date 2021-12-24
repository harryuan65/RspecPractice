RSpec.describe 'equality matchers' do
  let(:a) { 3.0 }
  let(:b) { 3 }

  describe 'eq matcher' do
    it 'tests for value and ignores type' do
      expect(a).to eq(3)
      expect(b).to eq(3.0)
      expect(a).to eq(b)
    end
  end

  describe 'eql matcher' do
    it 'tests for value including type' do
      expect(a).not_to eql(3)
      expect(b).not_to eql(3.0)
      expect(a).not_to eql(b)

      expect(a).to eq(3.0)
      expect(b).to eq(3)
    end
  end

  describe 'equal and be matcher' do
    let(:c) { [1, 2, 3] }
    let(:d) { [1, 2, 3] }
    let(:e) { c }

    before(:all) do
      puts <<-DOC
      \e[33m
        Check strict identity, in terms of memory location.
        \e[36m#equal\e[33m is the same as \e[36m#be\e[33m
      \e[0m
      DOC
    end

    it 'tests for identity' do
      expect(c).to eq(d) # value only
      expect(c).to eql(d) # value and type only

      expect(c).not_to equal(d)
      expect(e).to equal(c)

      expect(c).not_to be(d)
      expect(e).to be(c)
    end
  end
end
