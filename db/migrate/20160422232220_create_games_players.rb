class CreateGamesPlayers < ActiveRecord::Migration
  def change
    create_table :games_players, id: false do |t|
      t.belongs_to :deck, index: true
      t.belongs_to :game, index: true
    end
  end
end
