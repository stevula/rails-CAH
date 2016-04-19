FactoryGirl.define do
  factory :black_card do
    text "My ______ hurts!"
    pick 1
    draw 0
    deck_id 1
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
