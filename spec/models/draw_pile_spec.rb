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

    it 'has many cards' do
      expect(white_pile.cards).to have_at_least(1).white_cards
      expect(black_pile.cards).to have_at_least(1).black_cards
    end

    it 'has many decks' do
      expect(white_pile.decks).to have_at_least(1).decks
      expect(black_pile.decks).to have_at_least(1).decks
    end

    it 'has many remaining (undrawn) cards' do
      pending
    end

    it 'has many replenishable cards to refill from' do
      pending
    end
  end

  describe '#size' do
    it 'returns the number of remaining cards' do
      pending
    end
  end

  describe 'BlackPile' do
    describe '#pop' do
      it 'returns a black card' do
        expect(black_pile.pop).to be_a BlackCard
      end

      it 'does not return the same card twice before the cards are exhausted' do
        drawn_cards = []
        black_pile.size.times {drawn_cards << game.draw_black}
        expect(drawn_cards.uniq).to match_array(drawn_cards)
      end

      it 'draws repeated cards once the draw pile has been exhausted' do
        pending
        # game.black_pile.remaining_cards.times do
        #   game.draw_black
        # end
        # expect(game.draw_black).to be_a BlackCard
      end
    end
  end

  describe 'WhitePile' do
    describe '#draw(number_of_cards)' do
      pending
    end

    describe '#replenish' do
      pending
    end
  end
end
