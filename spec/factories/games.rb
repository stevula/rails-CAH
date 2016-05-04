FactoryGirl.define do
  factory :game do
    sequence(:id)
    win_threshold 10

    after(:build) do |game|
      create(:draw_pile, :white, game: game)
      create(:draw_pile, :black, game: game)
    end
  end
end
