RSpec.describe Hash do
  before(:all) do
    puts <<-DOC
      \e[33m
      RSpec provides "#subject" which automatically instanciates a new instance of the describe Class,
        and we can use it to replace let blocks like
      \e[34mlet(:my_hash) { Hash.new }\e[0m
      \e[36mIt is lazy-loaded and cached within each example.\e[0m
    DOC
  end

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
