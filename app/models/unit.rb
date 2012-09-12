class Unit < ActiveRecord::Base
  attr_accessible :comment, :items_per_unit, :minimum_purchase, :price_per_unit, :product_id

  validates :product_id, :presence => true

  belongs_to :product
  has_and_belongs_to_many :items

  def name
    product.name
  end

end
