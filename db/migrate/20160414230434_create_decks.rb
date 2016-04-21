class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string  :title, null: false
      t.string  :series
      t.boolean :official # => do not use null: false since false is considered blank
      t.text    :description
      
      t.timestamps null: false
    end
  end
end
