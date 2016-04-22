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
    it 'has many decks' do
      expect(game.decks).to have_at_least(2).items
    end
  end
end
