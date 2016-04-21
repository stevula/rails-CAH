FactoryGirl.define do
  factory :deck do
    id          1
    title       "Deckard's Main Deck"
    series      "The Deckard Series"
    official    false
    description "The coolest deck."

    factory :deck_with_cards do
      after(:build) do |deck|
        binding.pry
        create_list(:white_card, 10, deck: deck)
        create_list(:black_card, 2,  deck: deck)
      end
    end
  end
end
