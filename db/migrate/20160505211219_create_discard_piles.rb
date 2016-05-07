class CreateDiscardPiles < ActiveRecord::Migration
  def change
    create_table :discard_piles do |t|
      t.belongs_to :game, index: true
      
      t.timestamps null: false
    end
  end
end
