RSpec.describe Hash do
  # let(:my_hash) { Hash.new } # don't need this line!
  # RSpec provides "subject" which instanciates a new instance of the describe Class.
  # is lazy-loaded and cached within each example.

  it 'should be empty' do
    puts subject.class
    expect(subject.length).to eq(0)
    subject[:cat] = 'black'
    expect(subject.length).to eq(1)
  end

  it 'is isolated!' do
    expect(subject.length).to eq(0)
  end

  # googled: how to pass arguments to subject?
  # We can overwrite the subject helper method
  # subject { { name: 'harry' } }
  # it 'should be overwritten' do
  #   expect(subject[:name]).to eq('harry')
  # end
end
