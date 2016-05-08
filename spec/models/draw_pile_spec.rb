require 'rails_helper'

RSpec.describe DrawPile, type: :model do
  let(:white_pile)            {create(:white_pile)}
  let(:white_pile_with_cards) {create(:white_pile, :with_cards)}
  let(:black_pile)            {create(:black_pile)}

  context 'on validation' do
    it 'has a type' do
      black_pile.type = nil
      white_pile.type = nil
      expect(black_pile).to be_invalid
      expect(white_pile).to be_invalid
    end
  end

  context 'relationality' do
    it 'has a game' do
      expect(white_pile.game).to be_a Game
      expect(black_pile.game).to be_a Game
    end

    it 'has many remaining (undrawn) cards' do
      expect(white_pile_with_cards.cards).to have_at_least(1).white_cards
    end
  end

  describe '#size' do
    it 'returns the number of remaining cards' do
      expect(white_pile.size).to be white_pile.cards.count
      expect(white_pile_with_cards.size).to be white_pile_with_cards.cards.count
      expect(black_pile.size).to be black_pile.cards.count
    end
  end
end
