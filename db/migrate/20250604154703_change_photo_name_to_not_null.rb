class ChangePhotoNameToNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :photos, :name, false
  end
end
