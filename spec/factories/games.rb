FactoryGirl.define do
  factory :game do
    sequence(:id)

    after(:build) do |game|
      create_list(:deck, 3, games: [game])
      create(:deck, games: [game])
    end
  end
end
