class AddCoordinatesToBets < ActiveRecord::Migration[7.0]
  def change
    add_column :bets, :latitude, :float
    add_column :bets, :longitude, :float
  end
end
