# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

u = User.create(:email=>'dipidi@gmail.com', :password=>'123456')
o = Outpost.create( :nid=>'first_outpost', :base_location=>'downloads', :user=>u)


o.create_upload!('foo.rb')

puts 'seeded'