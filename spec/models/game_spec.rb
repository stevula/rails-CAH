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

    it 'has a current round number' do
      game.current_round = nil
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
end
