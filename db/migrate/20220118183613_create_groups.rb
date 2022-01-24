class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.time :from_time, null: false
      t.time :to_time, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
