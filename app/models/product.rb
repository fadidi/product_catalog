class Product < ActiveRecord::Base
  attr_accessible :category_id, :comment, :minimum_order, :name, :per_unit, :unit_price

  validates :name, :presence => true

  belongs_to :category
  has_many :items
  has_many :units

  default_scope :order => 'name ASC'
  scope :uncategorized, where("category_id IS NULL")

end
