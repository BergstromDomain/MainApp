class AddDateToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :day, :integer
    add_column :events, :month, :integer
    add_column :events, :year, :integer
  end
end
