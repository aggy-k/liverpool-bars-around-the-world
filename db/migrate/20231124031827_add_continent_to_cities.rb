class AddContinentToCities < ActiveRecord::Migration[7.0]
  def change
    rename_column :cities, :country, :country_name
    add_reference :cities, :country, foreign_key: true
  end
end
