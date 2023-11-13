class CreateExternalLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :external_links do |t|
      t.references :record, null: false, polymorphic: true
      t.string :url
      t.integer :type

      t.timestamps
    end
  end
end
