class BlackPile < DrawPile
  def draw
    top_card = self.remaining_cards.first
    self.remaining_cards.delete(top_card)
    top_card
  end
end
