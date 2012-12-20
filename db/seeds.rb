# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({"email"=>"dr@mymail.com", "first_name"=>"Dominic", "last_name"=>"Ramms", "password"=>"123456"})
User.create({"email"=>"sn@mymail.com", "first_name"=>"Sascha", "last_name"=>"Nonte", "password"=>"123456"})
User.create({"email"=>"mc@mymail.com", "first_name"=>"Marvin", "last_name"=>"Caspar", "password"=>"123456"})
User.create({"email"=>"tp@mymail.com", "first_name"=>"Tobias", "last_name"=>"Prein", "password"=>"123456"})
User.create({"email"=>"tk@mymail.com", "first_name"=>"Till", "last_name"=>"Krueger", "password"=>"123456"})
User.create({"email"=>"sm@mymail.com", "first_name"=>"Simon", "last_name"=>"Miketta", "password"=>"123456"})