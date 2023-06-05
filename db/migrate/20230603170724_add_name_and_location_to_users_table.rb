class AddNameAndLocationToUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :location, :string
  end
end