class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.integer :shop_id
      t.string :title
      t.string :image_id
      t.text :content

      t.timestamps
    end
  end
end
