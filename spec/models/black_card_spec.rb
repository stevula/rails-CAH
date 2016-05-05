require 'rails_helper'

RSpec.describe BlackCard, type: :model do
  let(:deck)                {create(:deck)}
  let(:black_card)          {deck.black_cards.first}
  let(:question_black_card) {deck.black_cards[1]}
  let(:double_black_card)   {deck.black_cards[2]}
  let(:triple_black_card)   {deck.black_cards[3]}

  it 'has a type of "BlackCard"' do
    expect(black_card.type).to eq "BlackCard"
  end

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
