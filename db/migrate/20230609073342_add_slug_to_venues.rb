class AddSlugToVenues < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :slug, :string
  end
end
