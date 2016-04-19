FactoryGirl.define do
  factory :black_card do
    text "My ______ hurts!"
    pick 1
    draw 0
    deck_id 1
  end

  factory :black_card_2 do
    text "My ______ hurts!"
    pick 2
    draw 0
    deck_id 1
  end

  factory :black_card_3 do
    text "My ______ hurts!"
    pick 3
    draw 2
    deck_id 1
  end
end
