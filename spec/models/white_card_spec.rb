require 'rails_helper'

RSpec.describe WhiteCard, type: :model do
  let(:white_card) {create(:white_card)}

  it 'has a type of "WhiteCard"' do
    expect(white_card.type).to eq "WhiteCard"
  end
end
