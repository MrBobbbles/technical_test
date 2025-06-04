class MakeGalleryNameNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :galleries, :name, false
  end
end
