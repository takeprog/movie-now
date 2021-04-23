class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.text :text, null: false
      t.integer :genre_id, null: false
      t.timestamps
    end
  end
end
