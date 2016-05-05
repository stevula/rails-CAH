require 'rails_helper'

RSpec.describe WhitePile, type: :model do
  let(:white_pile) {create(:white_pile)}

  describe '#draw(number_of_cards)' do
    it 'returns white cards' do
      expect(white_pile.draw(1).first).to be_a WhiteCard
    end

    it 'returns the given number of white cards' do
      expect(white_pile.draw(1)).to have_exactly(1).white_cards
    end

    it 'removes the cards from the pile once they are drawn' do
      drawn_card_1 = white_pile.draw(1).first
      expect(white_pile.cards).not_to include drawn_card_1
      drawn_card_2 = white_pile.draw(1).first
      expect(white_pile.cards).not_to include drawn_card_2
    end

    it 'does not return the same card twice while cards remain to be drawn' do
      drawn_cards = []
      white_pile.size.times {drawn_cards << white_pile.draw(1)}
      drawn_cards.flatten!
      expect(drawn_cards).to match_array drawn_cards.uniq
    end

    it 'TODO: repeats discarded cards once it is depleted (requires discard pile)' do
      pending
    end
  end

  describe '#replenish(discard_pile)' do
    it 'adds the cards in the discard pile back into the white draw pile' do
      # binding.pry
      depleted_pile = white_pile.draw(white_pile.size)
      expect(depleted_pile.size).to be 0
      # discard_pile = create_list(:white_card, 5)
    end

    it 'randomizes the cards' do
      pending
    end
  end
end
