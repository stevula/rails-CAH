FactoryGirl.define do
  factory :card do
    deck
    
    factory :white_card do
      type "WhiteCard"
      sequence(:text) {|n| "White card text #{n}."}
    end

    factory :black_card do
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
end
