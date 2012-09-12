class Item < ActiveRecord::Base
  attr_accessible :properties, :length, :memory_id, :pieces_per_package, :product_id, :unit_id, :vendor_sku, :comment, :vendor_name

  validates :vendor_sku, :presence => true, :uniqueness => true

  has_and_belongs_to_many :units
  belongs_to :product
  has_one :category, :through => :product

  def name
    (product.blank? ? vendor_name : product.name) + " [#{vendor_sku}]"
  end

  def category_name
    unless product.blank?
      unless product.category.blank?
        category.name
      else
        'add category'
      end
    else
      'add product'
    end
  end
end
