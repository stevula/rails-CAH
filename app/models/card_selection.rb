class CardSelection < ActiveRecord::Base
  belongs_to :game
  belongs_to :card

  validates :game, :card, presence: true
end
