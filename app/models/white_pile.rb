class WhitePile < DrawPile
  has_many   :replenishable_cards, through: :decks,            source: :card
  
  def draw(number_of_cards)
  end

  def replenish
  end
end
