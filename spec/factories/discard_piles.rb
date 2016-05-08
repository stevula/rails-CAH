FactoryGirl.define do
  factory :discard_pile do
    game

    after(:create) do |discard_pile|
      create_list(:white_card, 3, discard_piles: [discard_pile])
    end
  end
end
