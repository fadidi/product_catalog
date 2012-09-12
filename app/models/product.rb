class Product < ActiveRecord::Base
  attr_accessible :category_id, :comment, :minimum_order, :name, :per_unit, :store_sku, :unit_price

  validates :name, :store_sku, :presence => true

  belongs_to :category
  has_many :items
  has_many :units
end
