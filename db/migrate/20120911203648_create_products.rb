class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :store_sku
      t.integer :category_id
      t.integer :minimum_order
      t.integer :per_unit
      t.float :unit_price
      t.text :comment

      t.timestamps
    end
  end
end
