class DrawPile < ActiveRecord::Base
  belongs_to :game
  has_many   :decks_draw_piles
  has_many   :cards_draw_piles
  has_many   :decks,               through: :decks_draw_piles
  has_many   :remaining_cards,     through: :cards_draw_piles, source: :card
  has_many   :replenishable_cards, through: :decks,            source: :card

  def pop
    top_card = self.cards.first
    self.cards.delete(top_card)
    top_card
  end

  def draw(number_of_cards)
  end

  def size
    self.cards.count
  end

  def replenish
  end
end
