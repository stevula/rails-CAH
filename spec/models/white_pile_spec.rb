require 'rails_helper'

RSpec.describe WhitePile, type: :model do
  let(:game)         {create(:game)}
  let(:white_pile)   {game.white_pile}
  let(:discard_pile) {game.discard_pile}

  describe '#draw(draw_amount)' do
    it 'returns white cards' do
      expect(white_pile.draw.first).to be_a WhiteCard
    end

    it 'returns the given number of white cards' do
      expect(white_pile.draw).to have_exactly(1).white_cards
      expect(white_pile.draw(2)).to have_exactly(2).white_cards
    end

    it 'removes the cards from the pile once they are drawn' do
      drawn_card_1 = white_pile.draw.first
      drawn_card_2 = white_pile.draw.first
      expect(white_pile.cards).not_to include drawn_card_1
      expect(white_pile.cards).not_to include drawn_card_2
    end

    it 'does not return the same card twice while cards remain to be drawn' do
      drawn_cards = []
      white_pile.size.times {drawn_cards << white_pile.draw}
      drawn_cards.flatten!
      expect(drawn_cards).to match_array drawn_cards.uniq
    end

    it 'repeats discarded cards once it is depleted' do
      white_pile.draw(white_pile.size)
      expect(white_pile.size).to be 0
      expect(white_pile.draw.first).to be_a WhiteCard
    end

    it 'returns the correct number of cards even when there are not that many remaining in the pile' do
      number_to_draw = white_pile.size + 2
      expect(white_pile.draw(number_to_draw).length).to be number_to_draw
    end

    it 'exhausts the remaining cards before recycling used cards' do
      remaining_cards = white_pile.cards.to_a
      drawn_cards     = white_pile.draw(4)
      expect(remaining_cards - drawn_cards).to be_empty
    end

    it 'raises some error when there are not enough cards to draw from'

    it 'does not return cards in the same order every time'
  end

  describe '#replenish' do
    it 'adds the cards in the discard pile back into the white draw pile' do
      white_pile.draw(white_pile.size)
      expect(white_pile.size).to be 0
      white_pile.replenish
      expect(white_pile.cards).to match_array discard_pile.cards
    end
  end
end
