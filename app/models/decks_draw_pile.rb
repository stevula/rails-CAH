class DecksDrawPile < ActiveRecord::Base
  belongs_to :deck
  belongs_to :draw_pile
end
