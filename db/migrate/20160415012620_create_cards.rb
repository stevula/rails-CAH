class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text       :text
      t.string     :color
      t.integer    :pick
      t.integer    :draw
      t.references :deck
      t.references :pile
      
      t.timestamps null: false
    end
  end
end
