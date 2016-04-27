class Card < ActiveRecord::Base
  has_many   :card_selections
  has_many   :games, through: :card_selections
  belongs_to :deck

  validates  :text,    presence: true, uniqueness: {scope: :deck_id}
  validates  :type,    presence: true
  validates  :deck_id, presence: true
end
