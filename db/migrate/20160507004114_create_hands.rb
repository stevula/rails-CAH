class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands, index: false do |t|
      t.belongs_to :card,   index: true
      t.belongs_to :player, index: true
    end
  end
end
