class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :points, default: 0
      t.references :game

      t.timestamps null: false
    end
  end
end
