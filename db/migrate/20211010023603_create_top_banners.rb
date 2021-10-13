class CreateTopBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :top_banners do |t|
      t.integer :admin_id
      t.integer :shop_id
      t.string :image_id

      t.timestamps
    end
  end
end
