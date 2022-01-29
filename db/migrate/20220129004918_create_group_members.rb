class CreateGroupMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :group_members do |t|
      t.belongs_to :group
      t.belongs_to :user
      t.timestamps
    end
  end
end
