class CardsDiscardPile < ActiveRecord::Base
  belongs_to :card
  belongs_to :discard_pile
end
