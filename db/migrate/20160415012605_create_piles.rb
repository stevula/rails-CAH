class CreatePiles < ActiveRecord::Migration
  def change
    create_table :piles do |t|
      t.boolean    :discarded
      t.references :game

      t.timestamps null: false
    end
  end
end
