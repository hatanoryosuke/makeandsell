class CreateGenreItems < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_items do |t|
      t.references :genre, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
