class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :win_threshold, default: 10
      
      t.timestamps null: false
    end
  end
end
