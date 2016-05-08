require 'rails_helper'

RSpec.describe BlackCard, type: :model do
  # let(:deck)                {create(:deck)}
  let(:black_card)          {create(:black_card)}
  let(:black_card_question) {create(:black_card_question)}
  let(:black_card_double)   {create(:black_card_double)}
  let(:black_card_triple)   {create(:black_card_triple)}

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
    expect(black_card_question).to be_valid
    # neither
    black_card.text = "I'm a bad card."
    expect(black_card).to be_invalid
  end

  it 'requires as many picks as there are blanks' do
    expect(black_card.pick).to be 1
    expect(black_card_double.pick).to be 2
    expect(black_card_triple.pick).to be 3
  end
end
