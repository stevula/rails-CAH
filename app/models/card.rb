class Card < ActiveRecord::Base
  belongs_to :deck
  validates  :text, presence: true, uniqueness: {scope: :deck_id}
  validates  :type, presence: true
  validates  :deck_id, presence: true
end

class BlackCard < Card
  belongs_to :deck
  validates :pick, numericality: {greater_than: 0}
  validates :draw, numericality: true
  validate  :question_format, if: "text.present?"

  def question_format
    exceptions = ["Make a haiku."]
    return if exceptions.include? text

    unless text.match("______") || text[-1] == ("?")
      errors.add(:text, "must be formatted as a question")
    end
  end
end

class WhiteCard < Card
  belongs_to :deck
end
