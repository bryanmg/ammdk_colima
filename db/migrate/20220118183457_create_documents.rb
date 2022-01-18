class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.string :file_path

      t.timestamps
    end
  end
end
