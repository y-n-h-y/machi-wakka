class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :shop_id
      t.string :name
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
