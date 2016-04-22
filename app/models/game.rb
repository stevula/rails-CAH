class Game < ActiveRecord::Base
  has_many :players
  has_and_belongs_to_many :decks
  has_many :cards, through: :decks

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
