class Item < ActiveRecord::Base
  attr_accessible :properties, :length, :memory_id, :pieces_per_package, :product_id, :vendor_sku, :comment, :vendor_name, :unit_ids, :entered

  validates :vendor_sku, :presence => true, :uniqueness => true

  has_and_belongs_to_many :units
  has_many :products, :through => :units
  belongs_to :product
  has_one :category, :through => :product

  scope :by_sku, order('vendor_sku ASC')
  scope :by_property, order('properties ASC')

  def name
    "#{(properties.blank? ? vendor_name : properties)} [#{vendor_sku}]"
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

  def enter
    self.update_attributes(:entered => Time.now + 1.second)
  end

  def entered?
    entered.nil? ? false : entered > updated_at
  end

end
