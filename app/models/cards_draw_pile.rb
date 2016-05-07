class CardsDrawPile < ActiveRecord::Base
  belongs_to :card
  belongs_to :draw_pile
end