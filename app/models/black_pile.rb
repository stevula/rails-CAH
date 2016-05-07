class BlackPile < DrawPile
  def draw
    self.cards.delete(self.cards.shuffle.first).first
  end
end
