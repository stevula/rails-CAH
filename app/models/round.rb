class Round < ActiveRecord::Base
  belongs_to :game
  has_many :cards_rounds
  has_many :played_cards, through: :cards_rounds, source: :card
end
