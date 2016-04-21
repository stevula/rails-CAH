class Deck < ActiveRecord::Base
  has_many :cards
  validates :title,    presence: true
  validates :official, inclusion: {in: [true, false]}
end
