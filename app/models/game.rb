class Game < ActiveRecord::Base
  has_many :card_selections
  has_many :cards, through: :card_selections
  has_many :white_cards, through: :card_selections, source: :card, class_name: 'WhiteCard'
  has_many :black_cards, through: :card_selections, source: :card, class_name: 'BlackCard'

  validates :win_threshold, numericality: {greater_than: 0}

  def black
    decks       = self.decks
    random_deck = decks.sample
    black_cards = random_deck.black_cards
    black_cards.sample
  end

  def white
    decks       = self.decks
    random_deck = decks.sample
    white_cards = random_deck.white_cards
    white_cards.sample
  end
end
