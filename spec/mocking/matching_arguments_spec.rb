RSpec.describe 'matching argument' do
  # stubbing behavior of a object
  it 'can return different values depending on the argument' do
    three_element_array = double # [1, 2, 3]

    # mocking the Array#first method
    # arr.first => 1
    # arr.first(1) => [1]
    # arr.first(3) => [1, 2, 3]
    # arr.first(100) => [1, 2, 3]
    # specify the argument for different return value cases
    allow(three_element_array).to receive(:first).with(no_args).and_return(1)
    allow(three_element_array).to receive(:first).with(1).and_return([1])
    allow(three_element_array).to receive(:first).with(2).and_return([1, 2])
    allow(three_element_array).to receive(:first).with(be >= 3).and_return([1, 2, 3]) # with can take any matcher!!!!

    expect(three_element_array.first).to eq(1)
    expect(three_element_array.first(1)).to eq([1])
    expect(three_element_array.first(2)).to eq([1, 2])
    expect(three_element_array.first(3)).to eq([1, 2, 3])
    expect(three_element_array.first(100)).to eq([1, 2, 3])
    expect(three_element_array).to receive(:first).with(100).and_return([1, 2, 3])
    three_element_array.first(100)
  end
end

# NOTE
# We can mock the all behavior of the original object,
# but what do we do if the original object's behavior changes? We need to change all the mocked behavior as well??
#
#   => see ./instance_doubles_spec.rb
