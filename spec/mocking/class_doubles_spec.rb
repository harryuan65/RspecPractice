class Deck
  def self.build
    # build whole bunch of cards
  end
end

class CardGame
  attr_reader :cards

  def start
    @cards = Deck.build
  end
end

RSpec.describe CardGame do
  it 'can only implement class methods that are defined on a class' do
    puts <<-DOC
    \e[33m
      class_double('Deck', build: %w[Ace Queen])
      card_game = CardGame.new
      card_game.start
      expect(card_game.cards).to be_instance_of(Array)

      DOES NOT WORK because
        class_double('Deck', build: %w[Ace Queen])
      it self does not bind to the Deck class
    \e[0m
    DOC

    deck_klass = class_double(Deck, build: %w[Ace Queen]).as_stubbed_const # as_stubbed_const: Replace all Deck called in this example
    expect(deck_klass).to receive(:build)
    subject.start

    expect(subject.cards).to eq(%w[Ace Queen])
  end
end
