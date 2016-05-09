class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :cards_draw_piles
  has_many :cards_players
  has_many :cards_rounds
  has_many :draw_piles, through: :cards_draw_piles
  has_many :players,    through: :cards_players
  has_many :rounds,     through: :cards_rounds

  validates :text, uniqueness: {scope: :deck_id}, presence: true
  validates :type, presence: {in: ["WhiteCard", "BlackCard"]}
  validates :deck_id, presence: true
end
