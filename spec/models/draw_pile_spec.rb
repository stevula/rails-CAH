require 'rails_helper'

RSpec.describe DrawPile, type: :model do
  let(:white_pile) {create(:draw_pile, :white)}
  let(:black_pile) {create(:draw_pile, :black)}

  context 'on validation' do
  end

  context 'relationality' do
    it 'has a game' do
      expect(white_pile.game).to be_a Game
      expect(black_pile.game).to be_a Game
    end

    it 'has many cards' do
      expect(white_pile.cards).to have_at_least(1).white_cards
      expect(black_pile.cards).to have_at_least(1).black_cards
    end

    it 'has many decks' do
      expect(white_pile.decks).to have_at_least(1).decks
      expect(black_pile.decks).to have_at_least(1).decks
    end
  end
end
