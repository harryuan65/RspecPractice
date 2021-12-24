RSpec.describe 'shorthand it_expected' do
  subject { 5 }
  before(:all) do
    puts <<-DOC
      \e[36m
      When there is a subject, \e[33m#is_expected\e[36m can be used as one liner check.
      \e[35m
        subject { 5 }
        it { is_expected.to eq(5) }
      \e[0m
    DOC
  end
  context 'with classic syntax' do
    it 'should equal 5' do
      expect(subject).to eq(5)
    end
  end

  context 'with one-liner syntax' do
    it { is_expected.to eq(5) } # this puts "is expected to eq 5"
  end
end
