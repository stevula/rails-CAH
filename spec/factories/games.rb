FactoryGirl.define do
  factory :game do
    sequence(:id)
    win_threshold 10

    after(:build) do |game|
      create_list(:deck, 3, games: [game])
    end
  end
end
