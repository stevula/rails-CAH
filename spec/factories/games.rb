FactoryGirl.define do
  factory :game do
    win_threshold 10

    after(:create) do |game|
      create(:white_pile,   game: game)
      create(:black_pile,   game: game)
      create(:discard_pile, game: game)
    end

    factory :invalid_game do
      win_threshold nil
    end
  end
end
