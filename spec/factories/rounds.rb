FactoryGirl.define do
  factory :round do
    sequence(:round_number)
    game

    factory :invalid_round do
      round_number nil
    end
  end
end
