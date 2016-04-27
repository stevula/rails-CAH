class CreateCardSelections < ActiveRecord::Migration
  def change
    create_table :card_selections, id: false do |t|
      t.belongs_to :card
      t.belongs_to :game
    end
  end
end
