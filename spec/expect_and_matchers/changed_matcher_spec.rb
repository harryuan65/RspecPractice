RSpec.describe 'changed matcher' do
  subject(:arr) { [1, 2, 3] }
  subject(:harry) { { name: 'harry', role: 'NodeJs Developer', age: 0, money: 0 } }

  it 'checks that a method changes object state' do
    expect { arr.push(4) }.to change { arr.length }.from(3).to(4)
    expect { arr.push(4) }.to change { arr.length }.by(1)
  end

  it 'checks that harry\'s role changes from NodeJs dev to Rails dev' do
    expect do
      harry[:role] = 'Rails Developer'
    end.to change { harry[:role] }
      .from('NodeJs Developer')
      .to('Rails Developer')
  end

  it 'accept negative arguments' do
    expect { arr.pop }.to change { arr.length }.by(-1)
  end

  it 'can be chained' do
    expect do
      harry[:role] = 'Ruby On Rails Developer'
      harry[:age] = 30
      harry[:money] += 100
    end
      .to(change {  harry[:role] }
        .from('NodeJs Developer')
        .to('Ruby On Rails Developer'))
      .and(change { harry[:age] }.by(30))
      .and(change { harry[:money] }.by_at_least(80))
  end
end
