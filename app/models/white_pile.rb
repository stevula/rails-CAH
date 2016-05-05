class WhitePile < DrawPile
  def draw(number_of_cards)
    drawn_cards = self.cards.first(number_of_cards)
    self.cards.delete(drawn_cards)
  end

  def replenish(discard_pile)
    self.cards = discard_pile.cards
  end
end
