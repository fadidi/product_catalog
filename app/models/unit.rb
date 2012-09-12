class Unit < ActiveRecord::Base
  attr_accessible :comment, :items_per_unit, :minimum_purchase, :price_per_item, :product_id, :item_ids

  validates :product_id, :presence => true

  belongs_to :product
  has_and_belongs_to_many :items

  def name
    "#{pricing} #{product.name}"
  end

  def price
    price_per_item * items_per_unit
  end

  def pricing
    "#{items_per_unit} @ $#{price_per_item} = $#{price}/unit, min.#{minimum_purchase}"
  end

end
