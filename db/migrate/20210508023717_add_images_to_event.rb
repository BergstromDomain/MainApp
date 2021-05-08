class AddImagesToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :main_image, :text
    add_column :events, :thumb_image, :text
  end
end
