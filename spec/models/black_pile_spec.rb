require 'rails_helper'

RSpec.describe BlackPile, type: :model do
  let(:black_pile) {create(:black_pile)}

  describe '#draw' do
    it 'returns a black card' do
      expect(black_pile.draw).to be_a BlackCard
    end

    it 'does not return the same card twice before the cards are exhausted' do
      drawn_cards = []
      black_pile.size.times {drawn_cards << black_pile.draw}
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
