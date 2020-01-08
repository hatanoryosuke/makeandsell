class CreateGenreItems < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_items do |t|
      t.references :name
      t.string :item_id
      t.timestamps
    end
  end
end
