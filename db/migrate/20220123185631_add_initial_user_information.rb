class AddInitialUserInformation < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :string
    add_column :users, :belt, :integer
    add_column :users, :birth_date, :date
    add_index :users, :belt
    add_index :users, :role
  end
end
