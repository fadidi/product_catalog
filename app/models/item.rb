class Item < ActiveRecord::Base
  attr_accessible :attributes, :length, :memory_id, :pieces_per_package, :product_id, :unit_id, :vendor_sku
end
