class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :admin_id
      t.integer :shop_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
