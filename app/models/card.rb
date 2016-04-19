class Card < ActiveRecord::Base
  belongs_to :deck
end

class BlackCard < Card; end
class WhiteCard < Card; end
