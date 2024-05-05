class ChangeColumnNullUploaderOnVenues < ActiveRecord::Migration[7.0]
  def change
    change_column_null :venues, :uploader_id, false
  end
end
