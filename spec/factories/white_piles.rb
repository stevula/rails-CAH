FactoryGirl.define do
  factory :white_pile, parent: :draw_pile, class: WhitePile do
    type 'WhitePile'

    after(:build) do |draw_pile|
      FactoryGirl.create(:deck, draw_piles: [draw_pile])
      create_list(:white_card, 3, draw_piles: [draw_pile])
    end
  end
end
