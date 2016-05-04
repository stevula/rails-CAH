class Deck < ActiveRecord::Base
  has_many :cards
  has_many :black_cards
  has_many :white_cards
  has_many :decks_draw_piles
  has_many :draw_piles, through: :decks_draw_piles
  
  validates :title,    presence: true
  validates :official, inclusion: {in: [true, false]}
end
