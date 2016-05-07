FactoryGirl.define do
  factory :player do
    sequence(:id)
    game

    after(:build) do |player|
      create_list(:white_card, 7, players: [player])
      create(:game, players: [player])
    end
  end
end
