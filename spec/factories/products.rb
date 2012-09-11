# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    store_sku "MyString"
    category_id 1
    minimum_order 1
    per_unit 1
    unit_price 1.5
    comment "MyText"
  end
end
