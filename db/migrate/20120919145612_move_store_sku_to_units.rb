class MoveStoreSkuToUnits < ActiveRecord::Migration
  def up
    remove_column :products, :store_sku
    add_column :units, :store_sku, :string
  end

  def down
    add_column :products, :store_sku
    remove_column :units, :store_sku, :string
  end
end
