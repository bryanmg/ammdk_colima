class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer
    add_column :users, :belt, :string
    add_column :users, :birth_date, :date
    
    add_index :users, :belt
    add_index :users, :role
  end
end
