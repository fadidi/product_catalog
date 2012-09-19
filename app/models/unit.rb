class Unit < ActiveRecord::Base
  attr_accessible :comment, :items_per_unit, :minimum_purchase, :price_per_item, :product_id, :item_ids, :store_sku, :entered

  validates :product_id, :presence => true

  belongs_to :product
  has_and_belongs_to_many :items

  def name
    "#{pricing} #{product.name} [#{store_sku}]"
  end

  def price
    price_per_item * items_per_unit
  end

  def pricing
    "#{items_per_unit}x#{pieces}pcs @ $#{price_per_item} = $#{price}/unit, min.#{minimum_purchase}"
  end

  def pieces
    sum = 0
    items.each { |item| sum += item.pieces_per_package.to_i }
    total = sum / items.count
    (total == items.first.pieces_per_package) ? total : '?'
  end

  def enter
    self.update_attributes(:entered => Time.now + 1.second)
  end

  def entered?
    entered.nil? ? false : entered > updated_at
  end

end
