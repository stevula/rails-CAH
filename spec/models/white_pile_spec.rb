require 'rails_helper'

RSpec.describe WhitePile, type: :model do
  let(:white_pile) {create(:white_pile)}

  describe '#draw(number_of_cards)' do
    it 'returns white cards' do
      expect(white_pile.draw(1).first).to be_a WhiteCard
    end

    it 'returns the given number of white cards' do
      expect(white_pile.draw(1)).to have_exactly(1).white_cards
    end

    it 'does not return the same card twice while cards remain to be drawn' do
      pending
    end

    it 'TODO: repeats discarded cards once it is depleted (contingent on discard_pile' do
      pending
    end
  end

  describe '#replenish' do
    pending
  end

  context 'relationality' do
    it 'has many replenishable cards to refill from' do
      pending
    end
  end
end
