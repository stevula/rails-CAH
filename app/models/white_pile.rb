class WhitePile < DrawPile
  has_many   :replenishable_cards, through: :decks,            source: :card

  def draw(number_of_cards)
    drawn_cards = self.remaining_cards.first(number_of_cards)
    drawn_card_ids = drawn_cards.map {|card| card.id}
    self.remaining_cards.where(id: drawn_card_ids).delete_all
    drawn_cards
  end

  def replenish
  end
end
