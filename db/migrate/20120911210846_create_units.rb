class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :product_id
      t.integer :items_per_unit
      t.float :price_per_item
      t.integer :minimum_purchase
      t.text :comment

      t.timestamps
    end
  end
end
