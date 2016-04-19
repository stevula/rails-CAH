class Card < ActiveRecord::Base
  belongs_to :deck
  validates  :text, presence: true, uniqueness: true
  validates  :type, presence: true
  validates  :deck_id, presence: true
end

class BlackCard < Card
  validates :pick, numericality: {greater_than: 0}
  validates :draw, numericality: true
  validate :question_format, if: "text.present?"

  def question_format
    unless text.match("______") || text[-1] == ("?")
      errors.add(:text, "must be formatted as a question")
    end
  end
end

class WhiteCard < Card; end
