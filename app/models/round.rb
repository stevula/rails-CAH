class Round < ActiveRecord::Base
  belongs_to :game

  validates :round_number, numericality: true, presence: true
end
