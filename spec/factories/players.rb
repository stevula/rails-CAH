FactoryGirl.define do
  factory :player do
    game

    trait :with_cards do
      after(:create) do |player|
        create_list(:white_card, 7, players: [player])
      end
    end
  end
end
