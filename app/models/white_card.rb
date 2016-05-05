class WhiteCard < Card
  has_many   :cards_discard_piles, foreign_key: :card_id
  has_many   :discard_piles, through: :cards_discard_piles
end
