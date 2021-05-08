class AddImagesToPerson < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :main_image, :text
    add_column :people, :thumb_image, :text
  end
end
