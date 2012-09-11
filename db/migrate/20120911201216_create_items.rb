class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :product_id
      t.integer :pieces_per_package
      t.string :length
      t.integer :unit_id
      t.integer :memory_id
      t.string :properties
      t.string :vendor_sku
      t.text :comment

      t.timestamps
    end
  end
end
