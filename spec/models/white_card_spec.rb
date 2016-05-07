require 'rails_helper'

RSpec.describe WhiteCard, type: :model do
  let(:deck)                {create(:deck)}
  let(:white_card)          {deck.white_cards.first}

  it 'has a type of "WhiteCard"' do
    expect(white_card.type).to eq "WhiteCard"
  end
end
