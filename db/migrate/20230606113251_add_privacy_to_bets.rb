class AddPrivacyToBets < ActiveRecord::Migration[7.0]
  def change
    add_column :bets, :privacy, :string, default: "public"
  end
end
