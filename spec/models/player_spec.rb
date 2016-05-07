require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) {create(:player)}

  context 'on validation' do
  end

  context 'relationality' do
    it 'has many cards' do
      expect(player.cards).to have_at_least(1).cards
    end

    it 'has many games' do
      expect(player.games).to have_at_least(1).games
    end
  end
end
