require 'rails_helper'

RSpec.describe BlackPile, type: :model do
  let(:black_pile) {create(:black_pile)}

  describe '#draw' do
    it 'returns a black card' do
      expect(black_pile.draw).to be_a BlackCard
    end

    it 'does not return the same card twice' do
      drawn_cards = []
      black_pile.size.times {drawn_cards << black_pile.draw}
      expect(drawn_cards.uniq).to match_array(drawn_cards)
    end

    it 'does not return cards in the same order every time'

    it 'raises an error if its cards are exhausted'
  end
end
