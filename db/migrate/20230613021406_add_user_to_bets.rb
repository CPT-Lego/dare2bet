class AddUserToBets < ActiveRecord::Migration[7.0]
  def change
    add_reference :bets, :user, null: false, foreign_key: true
    add_reference :bets, :opponent, foreign_key: { to_table: :users }
    add_reference :bets, :winner, foreign_key: { to_table: :users }
  end
end
