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

Category.create([{
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
