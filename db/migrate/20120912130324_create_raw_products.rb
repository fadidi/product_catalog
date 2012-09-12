class CreateRawProducts < ActiveRecord::Migration
  def change
    create_table :raw_products do |t|
      t.string :title
      t.string :category
      t.string :subcategory
      t.string :per_packet
      t.string :length_mm
      t.string :memory
      t.string :dimensions
      t.string :sku
      t.string :minimum_order
      t.string :item_price
      t.string :per_unit
      t.string :unit_price
      t.string :comment
    end
  end
end
