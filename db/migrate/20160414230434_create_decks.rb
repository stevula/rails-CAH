class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.string :series
      t.boolean :official
      t.text :description
    end
  end
end
