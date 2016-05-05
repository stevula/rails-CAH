FactoryGirl.define do
  factory :black_card, parent: :card, class: BlackCard do
    type "BlackCard"
    sequence(:text) {|n| "Black card text ______ #{n}."}
    pick 1
    draw 0

    factory :black_card_question do
      text "What did I eat today?"
    end

    factory :black_card_double do
      text "I love ______ and ______."
      pick 2
    end

    factory :black_card_triple do
      text "_____ + _____ = _____."
      pick 3
      draw 2
    end
  end
end
