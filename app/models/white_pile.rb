class WhitePile < DrawPile
  def draw(number_of_cards)
    drawn_cards = self.cards.first(number_of_cards)
    drawn_card_ids = drawn_cards.map {|card| card.id}
    self.cards.where(id: drawn_card_ids).delete_all
    drawn_cards
  end

  def replenish
  end
end
