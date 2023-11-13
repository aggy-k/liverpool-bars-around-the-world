class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :name_ascii
      t.float :latitude
      t.float :longitude
      t.string :country
      t.string :country_iso2
      t.string :country_iso3
      t.string :timezone

      t.timestamps
    end
  end
end
