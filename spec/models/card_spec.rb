require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:black_card)          {build(:black_card)}
  let(:question_black_card) {build(:black_card, :question)}
  let(:double_black_card)   {build(:black_card, :double)}
  let(:triple_black_card)   {build(:black_card, :triple)}
  let(:white_card)          {build(:white_card)}

  describe 'Validations' do
    it 'has a text value' do
      p "*" * 80
      p black_card
      black_card.text = nil
      white_card.text = nil
      expect(black_card).to be_invalid
      expect(white_card).to be_invalid
      black_card.text = ""
      white_card.text = ""
      expect(black_card).to be_invalid
      expect(white_card).to be_invalid
    end

    it 'has a type' do
      black_card.type = nil
      white_card.type = nil
      expect(black_card).to be_invalid
      expect(white_card).to be_invalid
    end

    it 'has a unique text' do
      black_1 = black_card.save
      black_2 = black_card.dup
      white_1 = white_card.save
      white_2 = white_card.dup
      expect(black_2).to be_invalid
      expect(white_2).to be_invalid
    end
  end

  describe 'Relations' do
    it 'belongs to a Deck' do
      pending
    end
  end

  describe 'BlackCard' do
    it 'has a pick value of at least 1' do
      black_card.pick = 0
      expect(black_card).to be_invalid
    end

    it 'does not save without a draw value' do
      black_card.draw = nil
      expect(black_card).to be_invalid
    end

    it 'contains at least one blank or question mark' do
      # one blank
      expect(black_card).to be_valid
      # question mark
      expect(question_black_card).to be_valid
      # neither
      black_card.text = "I'm a bad card."
      expect(black_card).to be_invalid
    end

    it 'requires as many picks as there are blanks' do
      expect(black_card.pick).to be 1
      expect(double_black_card.pick).to be 2
      expect(triple_black_card.pick).to be 3
    end
  end

  describe 'WhiteCard' do
  end
end
