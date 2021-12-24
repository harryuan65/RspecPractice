RSpec.describe Hash do
  before(:all) do
    puts <<-DOC
      \e[33m
      We can also overwrite the \e[34m"#subject"\e[33m method to
      1. give it a name for clearer access
      2. pass in arguments for #new
      \e[0m
    DOC
  end

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

  describe 'nested example' do
    it 'nested harry is still harry' do
      expect(harry[:name]).to eq('harry')
    end

    it 'nested bob is still bob' do
      expect(bob[:name]).to eq('bob')
    end
  end
end
