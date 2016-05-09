require 'rails_helper'

RSpec.describe Round, type: :model do
  let(:round)                   {create(:round)}
  let(:round_with_played_cards) {create(:round, :with_played_cards)}
  let(:invalid_round)           {build(:invalid_round)}
  
  context 'on validation' do
    it 'has a round number' do
      expect(invalid_round).to be_invalid
      invalid_round.round_number = 1
      expect(invalid_round).to be_valid
    end
  end

  context 'relationality' do
    it 'belongs to a game' do
      expect(round.game).to be_a Game
    end

    it 'has many played cards' do
      expect(round_with_played_cards.played_cards).to have_at_least(1).cards 
      expect(round_with_played_cards.played_cards.first).to be_a WhiteCard
    end
  end
end
