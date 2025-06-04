class AddDescriptionToGalleries < ActiveRecord::Migration[8.0]
  def change
    add_column :galleries, :description, :text
  end
end
