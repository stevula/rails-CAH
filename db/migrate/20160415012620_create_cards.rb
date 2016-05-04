class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text       :text, null: false
      t.string     :type, null: false
      t.integer    :pick
      t.integer    :draw
      t.belongs_to :deck
      
      t.timestamps null: false
    end
  end
end
