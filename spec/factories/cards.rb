FactoryGirl.define do
  factory :card do
    sequence(:id)
    deck
  end
end
