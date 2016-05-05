FactoryGirl.define do
  factory :white_card, parent: :card, class: WhiteCard do
    type "WhiteCard"
    sequence(:text) {|n| "White card text #{n}."}
  end
end
