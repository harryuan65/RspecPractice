RSpec.describe 'allow method review' do
  it 'can customize return value for methods on doubles, defaults to nil' do
    calculator = double
    allow(calculator).to receive(:add)
    expect(calculator.add).to be_nil
  end

  it 'can customize return value for methods on doubles' do
    calculator = double
    allow(calculator).to receive(:add).and_return(15)
    expect(calculator.add).to eq(15)
    expect(calculator.add(1, 2, 3)).to eq(15)
    expect(calculator.add('apple')).to eq(15)
  end

  it 'can stub one or more methods on a real object' do
    puts <<-DOC
      Sometimes it's just THE ONE method that is annoying or complex,
      we can just stub the method instead of mocking the whole object.
    DOC
    arr = [1, 2, 3]
    expect(arr.sum).to eq(6) # original method

    allow(arr).to receive(:sum).and_return(10) # replace by stubbing
    expect(arr.sum).to eq(10)

    arr.push(4)
    expect(arr).to eq([1, 2, 3, 4]) # all other methods are still valid
  end

  it 'can return multiple return values in sequence' do
    mock_array = double # emulating an array pop!
    allow(mock_array).to receive(:pop).and_return(:c, :b, nil) # first time call returns :c, then :b , and then nil.
    expect(mock_array.pop).to eq(:c)
    expect(mock_array.pop).to eq(:b)
    expect(mock_array.pop).to be_nil
    expect(mock_array.pop).to be_nil
    expect(mock_array.pop).to be_nil
    expect(mock_array.pop).to be_nil
  end

  it 'can mock ENV as well' do
    allow(ENV).to receive(:[]).with('DB_HOST').and_return('postgoob')
    expect(ENV['DB_HOST']).to eq('postgoob')
  end
end
