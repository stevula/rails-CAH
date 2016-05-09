FactoryGirl.define do
  factory :round do
    game

    trait :with_played_cards do
      after(:create) do |round|
        create_list(:white_card, 7, rounds: [round])
      end
    end

    # factory :invalid_round do
    #   round_number nil
    # end
  end
end
