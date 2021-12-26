RSpec.describe 'spies' do
  let(:animal) { spy('aniMal') }
  it 'confirms that a message has been receive' do
    # Test double:
    # expect(animal).to receive(:eat_food)
    # animal.eat_food

    animal.eat_food
    animal.eat_fruit
    expect(animal).to have_received(:eat_food)
    expect(animal).not_to have_received(:eat_human)
  end

  it 'resets between example' do
    expect(animal).not_to have_received(:eat_food)
  end

  it 'retains the same functionality of a regular double' do
    animal.eat_food
    animal.eat_food
    animal.eat_food('Sushi')
    expect(animal).to have_received(:eat_food).exactly(3).times
    expect(animal).to have_received(:eat_food).at_least(2).times
    expect(animal).to have_received(:eat_food).with('Sushi')
    expect(animal).to have_received(:eat_food).once.with('Sushi')
  end
end
