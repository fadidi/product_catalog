class Item < ActiveRecord::Base
  attr_accessible :properties, :length, :memory_id, :pieces_per_package, :product_id, :unit_id, :vendor_sku, :comment, :vendor_name

  validates :vendor_sku, :presence => true, :uniqueness => true

  has_and_belongs_to_many :units
  belongs_to :product
  has_one :category, :through => :product
end
