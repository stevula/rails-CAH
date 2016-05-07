class WhitePile < DrawPile
  def draw(required_amount=1)
    deficit     = required_amount - self.size

    drawn_cards = draw_random_top(required_amount)
    drawn_cards = self.cards.delete(drawn_cards)

    if deficit > 0
      replenish
      additional_drawn = draw_random_top(deficit)
      drawn_cards     += self.cards.delete(additional_drawn)
    end

    drawn_cards
  end

  def replenish
    self.cards = self.game.discard_pile.cards
  end

  private

  def draw_random_top(x_cards)
    self.cards.shuffle.first(x_cards)
  end
end
