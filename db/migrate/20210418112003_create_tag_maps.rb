class CreateTagMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_maps do |t|
      t.references :movie, foreign_key: true
      t.references :tag,   foreign_key: true
      t.timestamps
    end
  end
end
