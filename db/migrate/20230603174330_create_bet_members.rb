class CreateBetMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :bet_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
