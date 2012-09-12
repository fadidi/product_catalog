class Category < ActiveRecord::Base
  attr_accessible :comment, :name

  validates :name, :presence => true
  
  has_many :products
  has_many :units, :through => :products
  has_many :items, :through => :products

  default_scope :order => 'name ASC'

end
