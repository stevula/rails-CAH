require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:black_card) do
    BlackCard.new(
      text:  "Let there be ______.",
      pick:  1,
      draw:  0
    )
  end

  let(:white_card) do
    WhiteCard.new(
      text: "A monkey with a cute little hat."
    )
  end

  it 'does not save without text' do
    expect(Card.new).to_not be_valid
  end
end
