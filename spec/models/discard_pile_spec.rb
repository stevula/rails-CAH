require 'rails_helper'

RSpec.describe DiscardPile, type: :model do
  let(:discard_pile) {create(:discard_pile)}

  context 'relationality' do
    it 'has a game' do
      expect(discard_pile.game).to be_a Game
    end
  end

  describe '#size' do
    it 'returns the number of cards it has' do
      expect(discard_pile.size).to be discard_pile.cards.count
    end
  end

  it 'contains white cards' do
    discard_pile.cards.each do |card|
      expect(card).to be_a WhiteCard
    end
  end
end
