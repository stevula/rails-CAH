FactoryGirl.define do
  factory :draw_pile do
    sequence(:id)
    game

    trait :white do
      type 'WhitePile'

      after(:build) do |draw_pile|
        create_list(:white_card, 3, draw_piles: [draw_pile])
      end
    end

    trait :black do
      type 'BlackPile'

      after(:build) do |draw_pile|
        create_list(:black_card, 3, draw_piles: [draw_pile])
      end
    end
  end
end
