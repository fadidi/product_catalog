# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create!([{
  :name => 'Jack Brown', 
  :email => 'jack@brownjohnf.com',
  :password => 'password',
  :password_confirmation => 'password'
},{
  :name => 'Richard Mounce', 
  :email => 'richardmounce@mounceendo.com',
  :password => 'please',
  :password_confirmation => 'please'
},{
  :name => 'Emily Schauer', 
  :email => 'emily@emilyschauer.com',
  :password => 'please',
  :password_confirmation => 'please'
}])
User.all.each do |user|
  user.confirm!
  user.grant :manager
end
User.find_by_email('jack@brownjohnf.com').add_role :admin

puts 'executing `db:load_raw_products`'
Rake::Task['db:load_raw_products'].invoke

puts 'loading raw products into system...'
RawProduct.all.each do |row|
  puts row.inspect
  category = Category.find_or_create_by_name(
    :name => "#{row.category} => #{row.subcategory}"
  )
  product = Product.find_or_create_by_name(
    :name => row.title,
    :store_sku => row.id,
    :category_id => category.id
  )
  item = Item.create(
    :product_id => product.id,
    :vendor_sku => row.sku,
    :properties => "#{row.length_mm} #{row.memory} #{row.dimensions}",
    :pieces_per_package => row.per_packet,
    :vendor_name => row.title,
    :comment => "excel_row:#{row.id}"
  )
  unit = Unit.find_or_create_by_product_id_and_items_per_unit(
    :product_id => product.id,
    :items_per_unit => row.per_unit,
    :minimum_purchase => row.minimum_order,
    :price_per_item => row.item_price,
    :comment => ((row.per_unit.to_i * row.item_price.to_f == row.unit_price.to_f) ? '' : 'check pricing')
  )
end
=begin
json.each do |row|
  puts row.inspect
  category = Category.find_or_create_by_name(:name => "#{row['subcategory']} -> #{row['length_mm']}")
  product = Product.find_or_create_by_name(:name => row['title'], :store_sku => row['item_price'], :category_id => category.id)
  item = Item.create(
    :product_id => product.id,
    :vendor_sku => row['item_price'],
    :properties => row['minimum_order'],
    :pieces_per_package => row['sku'],
    :vendor_name => row['title'],
    :comment => row['id']
  )
  unit = Unit.find_or_create_by_product_id_and_items_per_unit(
    :product_id => product.id,
    :items_per_unit => row['min_order'],
    :minimum_purchase => row['per_unit'],
    :price_per_item => row['unit_price'],
    :comment => row['id']
  )
end

puts json.count
puts Item.count
=end
