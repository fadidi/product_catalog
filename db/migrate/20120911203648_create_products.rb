class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :store_sku
      t.integer :category_id
      t.text :comment

      t.timestamps
    end
  end
end
