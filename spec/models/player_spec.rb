require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) {create(:player)}

  context 'on validation' do
  end

  context 'relationality' do
    it 'has many cards' do
      expect(player.cards).to have_at_least(1).cards
    end

    it 'belongs to a game' do
      expect(player.game).to be_a Game
    end

    it 'has a hand' do
    end
  end
end
