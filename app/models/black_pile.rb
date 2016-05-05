class BlackPile < DrawPile
  def draw
    self.cards.delete(self.cards.first)
  end
end
