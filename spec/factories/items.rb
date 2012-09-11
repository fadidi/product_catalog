# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    product_id 1
    pieces_per_package 1
    length "MyString"
    unit_id 1
    memory_id 1
    attributes "MyString"
    vendor_sku "MyString"
  end
end
