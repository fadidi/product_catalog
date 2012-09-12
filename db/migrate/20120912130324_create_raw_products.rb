class CreateRawProducts < ActiveRecord::Migration
  def change
    create_table :raw_products do |t|
      t.string :title
      t.string :subcategory
      t.string :length_mm
      t.string :per_packet
      t.string :dimensions
      t.string :sku
      t.string :minimum_order
      t.string :item_price
      t.string :per_unit
      t.string :unit_price
      t.string :item_price
      t.string :min_order
      t.string :min_order_cost
      t.string :blank1
    end
  end
end
