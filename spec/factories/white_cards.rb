FactoryGirl.define do
  factory :white_card do
    sequence(:text) {|n| "White card text #{n}."}
    deck
  end
end
