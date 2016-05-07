class CreateCardsDiscardPiles < ActiveRecord::Migration
  def change
    create_table :cards_discard_piles, id: false do |t|
      t.belongs_to :card
      t.belongs_to :discard_pile
    end
  end
end
