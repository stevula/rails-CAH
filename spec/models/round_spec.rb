require 'rails_helper'

RSpec.describe Round, type: :model do
  let(:round)         {create(:round)}
  let(:invalid_round) {build(:invalid_round)}
  
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
  end
end
