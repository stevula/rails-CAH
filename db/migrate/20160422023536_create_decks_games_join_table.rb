class CreateDecksGamesJoinTable < ActiveRecord::Migration
  def change
    create_table :decks_games, id: false do |t|
      t.belongs_to :decks, index: true
      t.belongs_to :games, index: true
    end
  end
end
