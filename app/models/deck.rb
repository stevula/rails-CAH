class Deck < ActiveRecord::Base
  has_many :cards
  validates :title,    presence: true
  validates :series,   presence: true
  validates :official, presence: true, inclusion: {in: [true, false]}
end
