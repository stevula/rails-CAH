class BlackCard < Card
  validates :pick, numericality: {greater_than: 0}
  validates :draw, numericality: {greater_than_or_equal_to: 0}
  validate  :question_format, if: "text.present?"

  def question_format
    exceptions = ["Make a haiku."]
    return if exceptions.include? text

    unless text.match("______") || text[-1] == ("?")
      errors.add(:text, "must be formatted as a question")
    end
  end
end
