class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.text :address
      t.float :latitude
      t.float :longitude
      t.references :city, null: false, foreign_key: true
      t.string :phone_number
      t.string :email
      t.string :website
      t.string :facebook
      t.string :instagram
      t.string :twitter
      t.string :tiktok
      t.references :uploader, foreign_key: { to_table: :users }
      t.boolean :is_verified, default: false
      t.references :venue_admin, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
