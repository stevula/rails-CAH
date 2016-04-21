class Deck < ActiveRecord::Base
  has_many :cards
  has_many :black_cards
  has_many :white_cards
  validates :title,    presence: true
  validates :official, inclusion: {in: [true, false]}
end
