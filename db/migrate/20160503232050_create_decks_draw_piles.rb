class CreateDecksDrawPiles < ActiveRecord::Migration
  def change
    create_table :decks_draw_piles, index: false do |t|
      t.belongs_to :deck
      t.belongs_to :draw_pile
      
      t.timestamps null: false
    end
  end
end
