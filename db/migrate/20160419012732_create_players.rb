class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :points, default: 0

      t.timestamps null: false
    end
  end
end
