class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.string :name
      t.string :stake
      t.string :location
      t.date :end_time
      t.integer :status, default: 0
      t.references :tag, null: true, foreign_key: true

      t.timestamps
    end
  end
end
