class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :product_id
      t.integer :items_per_unit, :default => 1
      t.float :price_per_item
      t.integer :minimum_purchase, :default => 1
      t.text :comment

      t.timestamps
    end
  end
end
