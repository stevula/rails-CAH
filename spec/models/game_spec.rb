require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) {create(:game)}
  
  describe 'relationality' do
    it 'has many decks' do
      expect(game.decks).to have_at_least(2).items
    end
  end
end
