require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:black_card) do
    BlackCard.new(
      text: "Let there be ______.",
      pick: 1,
      draw: 0
    )
  end

  let(:white_card) do
    WhiteCard.new(
      text: "A monkey with a cute little hat."
    )
  end

  it 'does not save without text' do
    card = Card.new(type: "BlackCard", pick: 1, draw: 0)
    expect(card).to_not be_valid
  end

  it 'does not save without a type' do
    card = Card.new(text: "I'm a bad, bad card.")
    expect(card).to_not be_valid
  end
end
