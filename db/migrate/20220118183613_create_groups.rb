class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.time :from_time
      t.time :to_time

      t.timestamps
    end
  end
end
