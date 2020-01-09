class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :image, null: false
      t.integer :user_id
      t.integer :size_w, null: false
      t.integer :size_d, null: false
      t.integer :size_h, null: false
      t.text :text
      t.timestamps
    end
  end
end
