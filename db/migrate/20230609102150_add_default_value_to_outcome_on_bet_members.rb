class AddDefaultValueToOutcomeOnBetMembers < ActiveRecord::Migration[7.0]
  def change
    change_column :bet_members, :outcome, :string, default: "undecided"
  end
end
