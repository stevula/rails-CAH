class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string  :title
      t.string  :series
      t.boolean :official
      t.text    :description
      
      t.timestamps null: false
    end
  end
end
