class CardsDrawPile < ActiveRecord::Base
  belongs_to :draw_pile
  belongs_to :card
end