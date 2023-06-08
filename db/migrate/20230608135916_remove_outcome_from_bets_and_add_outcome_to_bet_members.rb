class RemoveOutcomeFromBetsAndAddOutcomeToBetMembers < ActiveRecord::Migration[7.0]
  def change
    remove_column :bets, :outcome, :string
    add_column :bet_members, :outcome, :string
  end
end
