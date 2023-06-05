class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.string :name
      t.string :stake
      t.string :location
      t.date :end_time
      t.string :status, default: "pending"
      t.string :outcome, default: "ongoing"
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
