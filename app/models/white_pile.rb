class WhitePile < DrawPile
  def draw(required_amount=1)
    deficit = required_amount - self.size
    drawn_cards = self.cards.first(required_amount)

    if deficit > 0
      replenish
      drawn_cards += self.cards.first(deficit)
    end

    self.cards.delete(drawn_cards)
  end

  def replenish
    self.cards = self.game.discard_pile.cards
  end
end
