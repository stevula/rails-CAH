class CreateCardsDrawPiles < ActiveRecord::Migration
  def change
    create_table :cards_draw_piles, id: false do |t|
      t.belongs_to :card
      t.belongs_to :draw_pile
    end
  end
end
