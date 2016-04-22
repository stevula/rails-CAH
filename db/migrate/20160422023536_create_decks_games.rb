class CreateDecksGames < ActiveRecord::Migration
  def change
    create_table :decks_games, id: false do |t|
      t.belongs_to :deck, index: true
      t.belongs_to :game, index: true
    end
  end
end
