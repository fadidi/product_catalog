class RawProduct < ActiveRecord::Base
  attr_accessible :id, :title, :category, :subcategory, :per_packet, :length_mm, :memory, :dimensions, :sku, :minimum_order, :item_price, :per_unit, :unit_price, :comment
end
