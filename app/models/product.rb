class Product < ActiveRecord::Base
  attr_accessible :category_id, :comment, :minimum_order, :name, :per_unit, :store_sku, :unit_price
end
