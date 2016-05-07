class Player < ActiveRecord::Base
  has_many :cards_players
  has_many :games_players
  has_many :cards, through: :cards_players
  has_many :games, through: :games_players
end
