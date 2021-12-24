RSpec.describe Hash do
  subject(:harry) do
    {
      name: 'harry',
      position: 'Ruby on Rails developer'
    }
  end

  subject(:bob) do
    {
      name: 'bob',
      position: 'Rust Web Developer'
    }
  end

  it 'has tow k-v pairs' do
    puts "\e[33mIf having multiple subject and accessing implicitly, the subject will be \"#{subject[:name]}\e[0m\""
    expect(subject.length).to eq(2)
  end

  it 'harry is harry' do
    expect(harry[:name]).to eq('harry')
  end

  it 'bob is bob' do
    expect(bob[:name]).to eq('bob')
  end
end
