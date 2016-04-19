require 'rails_helper'

RSpec.describe Card, type: :model do
  let (:black_card) {build(:black_card)}
  let (:white_card) {build(:white_card)}

  it 'does not save without text' do
    black_card.text = nil
    white_card.text = nil

    expect(black_card).to_not be_valid
    expect(white_card).to_not be_valid
  end

  it 'does not save without a type' do
    black_card.type = nil
    white_card.type = nil
    expect(black_card).to_not be_valid
    expect(white_card).to_not be_valid
  end

  describe 'BlackCard' do
    it 'requires a pick value of at least 1' do
      black_card.pick = 0
      expect(black_card).to_not be_valid
    end

    it 'does not save without a draw value' do
      black_card.draw = nil
      expect(black_card).to_not be_valid
    end

    it 'contains at least one blank or question mark' do
      # one blank
      expect(black_card).to be_valid
      # question mark
      black_card.text = "What did I eat today?"
      expect(black_card).to be_valid
      # neither
      black_card.text = "I'm a bad card."
      expect(black_card).to_not be_valid
    end
  end

  describe 'WhiteCard' do
    it 'has at least one character' do
      expect(white_card).to be_valid
      white_card.text = ""
      expect(white_card).not_to be_valid
    end
  end
end
