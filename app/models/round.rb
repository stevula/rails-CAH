class Round < ActiveRecord::Base
  belongs_to :game
  has_many :cards_rounds
  has_many :played_cards, through: :cards_rounds, source: :card

  validates :round_number, numericality: true, presence: true
end
