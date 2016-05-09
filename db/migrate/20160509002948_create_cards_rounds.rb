class CreateCardsRounds < ActiveRecord::Migration
  def change
    create_table :cards_rounds, index: false do |t|
      t.belongs_to :card
      t.belongs_to :round
    end
  end
end
