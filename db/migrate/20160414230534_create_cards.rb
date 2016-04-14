class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :text
      t.string :color
      t.integer :blanks
    end
  end
end
