# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit do
    product_id 1
    items_per_unit 1
    price_per_unit 1.5
    minimum_purchase 1
    comment "MyText"
  end
end
