class CreateLearningResources < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_resources do |t|
      t.string :name, null: false
      t.text :description
      t.integer :belt
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
