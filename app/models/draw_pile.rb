class DrawPile < ActiveRecord::Base
  belongs_to :game
  has_many   :cards_draw_piles
  has_many   :cards, through: :cards_draw_piles
  has_many   :decks_draw_piles
  has_many   :decks, through: :decks_draw_piles

  def pop
    top_card = self.cards.first
    self.cards.delete(top_card)
    top_card
  end

  def remaining_cards
    self.cards.count
  end
end
