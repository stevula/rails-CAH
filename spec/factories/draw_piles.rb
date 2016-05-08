FactoryGirl.define do
  factory :draw_pile do
    game

    trait :with_cards do
      after(:create) do |draw_pile|
        create_list(:white_card, 10, draw_piles: [draw_pile])
      end
    end
  end
end
