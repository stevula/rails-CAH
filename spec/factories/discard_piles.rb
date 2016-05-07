FactoryGirl.define do
  factory :discard_pile do
    sequence(:id)
    game

    after(:build) do |discard_pile|
      create_list(:white_card, 3, discard_piles: [discard_pile])
    end
  end
end
