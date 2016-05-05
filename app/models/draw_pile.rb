class DrawPile < ActiveRecord::Base
  belongs_to :game
  has_many   :decks_draw_piles
  has_many   :cards_draw_piles
  has_many   :decks,               through: :decks_draw_piles
  has_many   :remaining_cards,     through: :cards_draw_piles, source: :card

  def size
    self.remaining_cards.count
  end
end
