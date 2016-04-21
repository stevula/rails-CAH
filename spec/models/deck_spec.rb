require 'rails_helper'

RSpec.describe Deck, type: :model do
  let(:deck) {create(:deck)}

  describe 'on validation' do
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

  describe 'relationality' do
    it 'has many cards' do
      expect(deck.cards).to have_at_least(2).items
    end
  end
end
