class Card < ActiveRecord::Base
  belongs_to :deck
  has_many   :cards_draw_piles
  has_many   :draw_piles, through: :cards_draw_piles

  validates  :text,    presence: true, uniqueness: {scope: :deck_id}
  validates  :type,    presence: true
  validates  :deck_id, presence: true
end
