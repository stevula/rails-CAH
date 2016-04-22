class Deck < ActiveRecord::Base
  has_many :cards
  has_many :black_cards
  has_many :white_cards
  has_and_belongs_to_many :games
  
  validates :title,    presence: true
  validates :official, inclusion: {in: [true, false]}
end
