class CreateOpeningHours < ActiveRecord::Migration[7.0]
  def change
    create_table :opening_hours do |t|
      t.references :venue, null: false, foreign_key: true
      t.integer :wday
      t.jsonb :hours, default: []

      t.timestamps
    end
  end
end
