class AddDaysToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :days_of_the_week, :text
  end
end
