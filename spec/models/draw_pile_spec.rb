require 'rails_helper'

RSpec.describe DrawPile, type: :model do
  let(:white_pile) {create(:white_pile)}
  let(:black_pile) {create(:black_pile)}

  context 'on validation' do
  end

  context 'relationality' do
    it 'has a game' do
      expect(white_pile.game).to be_a Game
      expect(black_pile.game).to be_a Game
    end

    it 'has many remaining (undrawn) cards' do
      expect(white_pile.cards).to have_at_least(1).white_cards
      expect(black_pile.cards).to have_at_least(1).black_cards
    end
  end

  describe '#size' do
    it 'returns the number of remaining cards' do
      expect(white_pile.size).to be white_pile.cards.count
      expect(black_pile.size).to be black_pile.cards.count
    end
  end
end
