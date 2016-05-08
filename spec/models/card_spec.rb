require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:white_card) {create(:white_card)}
  let(:black_card) {create(:black_card)}

  context 'on validation' do
    it 'has a text value' do
      black_card.text = nil
      white_card.text = nil
      expect(black_card).to be_invalid
      expect(white_card).to be_invalid
      black_card.text = ""
      white_card.text = ""
      expect(black_card).to be_invalid
      expect(white_card).to be_invalid
    end

    it 'has a unique text value' do
      black_1 = black_card.save
      black_2 = black_card.dup
      white_1 = white_card.save
      white_2 = white_card.dup
      expect(black_2).to be_invalid
      expect(white_2).to be_invalid
    end

    it 'has a type' do
      black_card.type = nil
      white_card.type = nil
      expect(black_card).to be_invalid
      expect(white_card).to be_invalid
    end
  end

  describe 'relationality' do
    it 'belongs to a deck' do
      expect(white_card.deck).to be_a Deck
      expect(black_card.deck).to be_a Deck
    end
  end
end
