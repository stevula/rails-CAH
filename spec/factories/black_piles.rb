FactoryGirl.define do
  factory :black_pile, parent: :draw_pile, class: BlackPile do
    type 'BlackPile'

    after(:build) do |draw_pile|
      create_list(:black_card, 3, draw_piles: [draw_pile])
    end
  end
end
