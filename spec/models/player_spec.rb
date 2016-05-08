require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player)            {create(:player)}
  let(:player_with_cards) {create(:player, :with_cards)}

  context 'on validation' do
  end

  context 'relationality' do
    it 'has many cards' do
      expect(player_with_cards.cards).to have_at_least(1).cards
    end

    it 'belongs to a game' do
      expect(player.game).to be_a Game
    end

    it 'has a hand'
  end
end
