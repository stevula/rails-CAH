require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) {create(:game)}
  
  context 'on validation' do
    it 'has a win threshold' do
      expect(game).to be_valid
      game.win_threshold = 0
      expect(game).to be_invalid
      game.win_threshold = ""
      expect(game).to be_invalid
      game.win_threshold = nil
      expect(game).to be_invalid
    end
  end

  context 'relationality' do
    it 'has many decks' do
      expect(game.decks).to have_at_least(2).items
    end
  end

  describe '#black' do
    it 'returns a random black card from any of its decks' do
      card = game.black
      expect(card).to be_a BlackCard
      expect(game.decks).to include card.deck
    end

    it 'does not return the time same card twice' do
      number_of_black_cards = game.decks.inject(0) {|sum, deck| sum + deck.black_cards.count}
      card = game.black
      expect(game.black).not_to be card
    end
  end

  describe '#white' do
    it 'returns a random white card from any of its decks' do
      card = game.white
      expect(card).to be_a WhiteCard
      expect(game.decks).to include card.deck
    end

    it 'does not return the time same card twice' do
      puts number_of_white_cards = game.decks.inject(0) {|sum, deck| sum + deck.white_cards.count}
      card = game.white
      expect(game.white).not_to be card
    end
  end
end
