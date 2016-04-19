class Card < ActiveRecord::Base
  belongs_to :deck
  validates  :text, presence: true, uniqueness: true
  validates  :type, presence: true
  validates  :deck_id, presence: true
end

class BlackCard < Card
  validates :pick, numericality: true
  validates :draw, numericality: true
end

class WhiteCard < Card; end
