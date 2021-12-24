puts <<~DOC
  \e[33m The include_context method injects context (i.e. before blocks, instance variables, helper methods, let variables) into an example group. \e[0m
DOC

RSpec.shared_context 'common' do
  # body of a context
  before do
    @foods = []
  end

  def some_helper_method
    5
  end

  let(:some_variable) { [1, 2, 3] }
end

RSpec.describe 'First example group' do
  include_context 'common'

  before(:all) do
    puts <<~DOC
      \e[34mEvery data in here is from shared context.\e[0m
    DOC
  end

  it '@foods is an array' do
    expect(@foods).to be_instance_of(Array)
  end

  it 'has method \'some_helper_method\' that returns 5' do
    expect(some_helper_method).to eq(5)
  end

  it 'some_variable is an array' do
    expect(some_variable).to be_instance_of(Array)
  end

  it 'some_variable contains 1, 2, 3' do
    expect(some_variable).to eq([1, 2, 3])
  end
end

RSpec.describe 'Second example group' do
  include_context 'common'

  before(:all) do
    puts <<~DOC
      \e[34mEvery data in here is from shared context.\e[0m
    DOC
  end

  it 'allows us to access @foods, which is an array' do
    expect(@foods).to eq([])
  end
end
