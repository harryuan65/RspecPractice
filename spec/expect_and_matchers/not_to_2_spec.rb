RSpec.describe 'not_to method' do
  it 'checks for the inverse of a matcher' do
    expect(5).not_to eq(10)
    expect([1, 2, 3]).not_to equal([1, 2, 3])
    expect([1, 2]).not_to be_empty
    # expect([1, 2]).not_to all(be > 3) #  `expect().not_to all( matcher )` is not supported. LOL
    expect(10).not_to be_odd
    expect(nil).not_to be_truthy
    expect(5).not_to respond_to(:explode)
    expect(%i[a b]).not_to include(:c, :d)
    expect({ name: 'harry' }).not_to include(name: 'bob')
    expect(StandardError.new).not_to respond_to(:say_it_is_fine)
    # expect(StandardError.new).not_to have_attributes(name: 'apple') does not respond to name, can't test
    expect(5).not_to respond_to(:length)
    expect { 11 / 3 }.not_to raise_error(ZeroDivisionError) # bad practive, since could raise false positive
  end
end
