class Game < ActiveRecord::Base
  has_one  :black_pile
  has_one  :white_pile

  validates :win_threshold, numericality: {greater_than: 0}
end
