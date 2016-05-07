module Pile
  extend ActiveSupport::Concern

  included do
    belongs_to :game
  end

  def size
    self.cards.count
  end
end