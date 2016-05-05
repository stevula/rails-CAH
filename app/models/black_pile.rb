class BlackPile < DrawPile
  def draw
    top_card = self.cards.first
    self.cards.delete(top_card)
    top_card
  end
end
