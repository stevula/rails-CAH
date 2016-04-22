FactoryGirl.define do
  factory :deck do
    sequence(:id)
    title       "Deckard's Main Deck"
    series      "The Deckard Series"
    official    false
    description "The coolest deck."

    after(:build) do |deck|
      create_list(:white_card, 10, deck: deck)
      create(:black_card,          deck: deck)
      create(:black_card_question, deck: deck)
      create(:black_card_double,   deck: deck)
      create(:black_card_triple,   deck: deck)
    end
  end
end
