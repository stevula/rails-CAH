class DrawPile < ActiveRecord::Base
  include Pile
  
  has_many :cards_draw_piles
  has_many :cards, through: :cards_draw_piles, source: :card

  validates :type, inclusion: {in: ["WhitePile", "BlackPile"]}
end
