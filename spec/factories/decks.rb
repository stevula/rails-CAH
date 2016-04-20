FactoryGirl.define do
  factory :deck do
    title       "Deckard's Main Deck"
    series      "The Deckard Series"
    official    false
    description "The coolest deck."

    after(:create) do |deck, evaluator|
      create_list(:white_card, 10, deck: deck)
      create_list(:black_card, 2, deck: deck)
    end
  end
end
