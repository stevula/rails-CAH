class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string  :title, null: false
      t.string  :series, null: false
      t.boolean :official, null: false
      t.text    :description
      
      t.timestamps null: false
    end
  end
end
