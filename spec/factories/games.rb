FactoryGirl.define do
  factory :game do
    sequence(:id)
    win_threshold 10

    after(:save) do |game|
      create(:white_pile,   game: game)
      create(:black_pile,   game: game)
      create(:discard_pile, game: game)
    end
  end
end
