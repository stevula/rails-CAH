class DiscardPile < ActiveRecord::Base
  include Pile

  has_many :cards_discard_piles
  has_many :cards, through: :cards_discard_piles, source: :card
end
