FactoryGirl.define do
  factory :black_card do
    sequence(:text) {|n| "Black card text ______ #{n}."}
    pick 1
    draw 0
    deck
  end

  trait :question do
    text "What did I eat today?"
  end

  trait :double do
    text "I love ______ and ______."
    pick 2
    draw 0
  end

  trait :triple do
    text "_____ + _____ = _____."
    pick 3
    draw 2
  end
end
