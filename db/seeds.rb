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

=begin
puts 'building categories...'
Category.create!([{
  :name => 'Burs'
},{
  :name => 'Reamers'
},{
  :name => 'Files'
},{
  :name => 'Cups'
},{
  :name => 'Broaches'
},{
  :name => 'Drills'
},{
  :name => 'Paste Carriers'
},{
  :name => 'Pluggers'
},{
  :name => 'Points'
},{
  :name => 'Posts'
},{
  :name => 'Rotary Instruments'
}])


puts 'building products...'
Product.create!([{
  :name => 'Short Barbed Broaches',
  :category_id => Category.find_by_name('Broaches').id,
  :store_sku => 'SBB001',
  :comment => 'Seeded by app.'
}])
=end

puts 'building items...'
items = [{
  :pieces_per_package => 6,
  :properties => '21MM SIZE 1 <SSB>',
  :vendor_sku => '4841478212',
  :vendor_name => 'SHORT BARBED BROACHES(6PCS/PKG)',
  :comment => 'Seeded by app.'
},{
  :pieces_per_package => 6,
  :properties => '21MM SIZE 1-6 <SSB>',
  :vendor_sku => '4841432212',
  :vendor_name => 'SHORT BARBED BROACHES(6PCS/PKG)',
  :comment => 'Seeded by app.'
},{
  :pieces_per_package => 6,
  :properties => '21MM SIZE 2 <SSB>',
  :vendor_sku => '4841778212',
  :vendor_name => 'SHORT BARBED BROACHES(6PCS/PKG)',
  :comment => 'Seeded by app.'
},{
  :pieces_per_package => 6,
  :properties => '21MM SIZE 2-4 <SSB>',
  :vendor_sku => '4841724212',
  :vendor_name => 'SHORT BARBED BROACHES(6PCS/PKG)',
  :comment => 'Seeded by app.'
},{
  :pieces_per_package => 6,
  :properties => '21MM SIZE 3 <SSB>',
  :vendor_sku => '4842078212',
  :vendor_name => 'SHORT BARBED BROACHES(6PCS/PKG)',
  :comment => 'Seeded by app.'
},{
  :pieces_per_package => 6,
  :properties => '21MM SIZE 4 <SSB>',
  :vendor_sku => '4842478212',
  :vendor_name => 'SHORT BARBED BROACHES(6PCS/PKG)',
  :comment => 'Seeded by app.'
},{
  :pieces_per_package => 6,
  :properties => '21MM SIZE 5 <SSB>',
  :vendor_sku => '4842878212',
  :vendor_name => 'SHORT BARBED BROACHES(6PCS/PKG)',
  :comment => 'Seeded by app.'
},{
  :pieces_per_package => 6,
  :properties => '21MM SIZE 6 <SSB>',
  :vendor_sku => '4843278212',
  :vendor_name => 'SHORT BARBED BROACHES(6PCS/PKG)',
  :comment => 'Seeded by app.'
}]

items.each do |item|
  puts item.inspect
  Item.create!(item.merge(:product_id => Product.find_or_create_by_name!(:name => item[:vendor_name], :store_sku => item[:vendor_sku]).id))
end
