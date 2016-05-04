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
    it 'has a black draw pile' do
      expect(game.black_pile).to be_a BlackPile
    end

    it 'has a white draw pile' do
      expect(game.white_pile).to be_a WhitePile
    end
  end

  describe '#draw_black' do
    it 'returns a black card' do
      expect(game.draw_black).to be_a BlackCard
    end

    it 'does not return the same card twice before the cards are exhausted' do
      drawn_cards = []
      game.black_pile.remaining_cards.times do
        drawn_cards << game.draw_black
      end
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

  describe '#draw_white' do
    it 'returns a white card' do
      expect(game.draw_white).to be_a WhiteCard
    end

    it 'does not return the same card twice before the cards are exhausted' do
      drawn_cards = []
      game.white_pile.remaining_cards.times do
        drawn_cards << game.draw_black
      end
      expect(drawn_cards.uniq).to match_array(drawn_cards)
    end

    it 'draws repeated cards once the draw pile has been exhausted' do
      pending
    end
  end
end
