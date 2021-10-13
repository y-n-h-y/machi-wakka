class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :admin_id
      t.integer :shop_id
      t.integer :customer_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
