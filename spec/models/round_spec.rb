require 'rails_helper'

RSpec.describe Round, type: :model do
  let(:round) {create(:round)}
  
  context 'on validation' do
  end

  context 'relationality' do
    it 'belongs to a game' do
      expect(round.game).to be_a Game
    end
  end
end
