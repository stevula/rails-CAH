class Game < ActiveRecord::Base
  has_one  :black_pile
  has_one  :white_pile

  validates :win_threshold, numericality: {greater_than: 0}

  def draw_black
    self.black_pile.pop
  end

  def draw_white
    self.white_pile.pop
  end
end
