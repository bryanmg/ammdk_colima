class UserBeltToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :belt
    add_column :users, :belt, :integer
    add_index :users, :belt
  end
end
