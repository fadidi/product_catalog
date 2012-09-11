class Item < ActiveRecord::Base
  attr_accessible :properties, :length, :memory_id, :pieces_per_package, :product_id, :unit_id, :vendor_sku, :comment

  validates :vendor_sku, :presence => true, :uniqueness => true

  belongs_to :product
end
