require 'rails_helper'

RSpec.describe Deck, type: :model do
  let(:deck)            {create(:deck)}
  let(:deck_with_cards) {create(:deck, :with_cards)}

  context 'on validation' do
    it 'has a title' do
      deck.title = nil
      expect(deck).to be_invalid
      deck.title = ""
      expect(deck).to be_invalid
    end

    it 'has an "official" status of true or false' do
      deck.official = nil
      expect(deck).to be_invalid
    end
  end

  context 'relationality' do
    it 'has many cards' do
      expect(deck_with_cards.cards.first).to be_a Card
      expect(deck_with_cards.cards).to have_at_least(1).cards
    end
  end
end
