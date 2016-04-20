require 'rails_helper'

RSpec.describe Deck, type: :model do
  let(:deck) {build(:deck)}

  describe 'Validations' do
    it 'has a title' do
      deck.title = nil
      expect(deck).to be_invalid
      deck.title = ""
      expect(deck).to be_invalid
    end

    it 'has a series' do
      deck.series = nil
      expect(deck).to be_invalid
      deck.series = ""
      expect(deck).to be_invalid
    end

    it 'has an "official" status of true or false' do
      deck.official = nil
      expect(deck).to be_invalid
    end
  end

  describe 'Relations' do
    it 'has many cards' do
      pending
    end
  end
end
