class CreateDrawPiles < ActiveRecord::Migration
  def change
    create_table :draw_piles do |t|
      t.string     :type, null: false
      t.belongs_to :game, index: true
      
      t.timestamps null: false
    end
  end
end
