class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :actor_tag
      t.string :genre_tag
      t.string :distribution_site_tag
      t.string :other_tag
      t.timestamps
    end
  end
end
