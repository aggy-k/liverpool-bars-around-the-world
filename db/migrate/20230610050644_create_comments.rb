class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.references :parent, foreign_key: { to_table: :comments }
      t.integer :votes, default: 0
      t.text :body

      t.timestamps
    end
  end
end
