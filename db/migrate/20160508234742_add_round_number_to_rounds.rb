class AddRoundNumberToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :round_number, :integer
  end
end
