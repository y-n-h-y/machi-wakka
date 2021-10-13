class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :admin_id
      t.integer :shop_id
      t.string :name
      t.string :image_id
      t.text :content
      t.integer :price

      t.timestamps
    end
  end
end
