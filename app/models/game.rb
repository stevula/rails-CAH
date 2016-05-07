class Game < ActiveRecord::Base
  has_one  :black_pile
  has_one  :white_pile
  has_one  :discard_pile
  has_many :players
  has_many :rounds

  validates :win_threshold, numericality: {greater_than: 0}
end
