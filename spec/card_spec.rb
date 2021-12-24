# frozen_string_literal: true

class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

RSpec.describe 'Card' do
  let(:card) { Card.new('Ace', 'Spades') }

  # def card
  #   Card.new('Ace', 'Spades')
  # end

  # before do
  #   @card = Card.new('Ace', 'Spades')
  # end

  it 'has a rank' do
    expect(card.rank).to eq('Ace')
  end

  it 'has a suit' do
    expect(card.suit).to eq('Spades')
    card.suit = 'Queen'
    expect(card.suit).to eq('Queen')
  end
end
