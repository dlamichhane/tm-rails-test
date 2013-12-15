# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating role"
['admin', 'manager'].each do |role|
  Role.find_or_create_by_name role
end

user = AdminUser.where(:email => "admin@example.com").first
if user.role_id.blank?
	puts "Updating Admin user"
	user.update_attributes(:role_id => Role.first.id)
end

user = AdminUser.where(:email => "cm@example.com").first
if user.blank?
	puts  "Creating new user"
	AdminUser.create!(:email => "cm@example.com", :password => "password", :password_confirmation => "password", :role_id => Role.last.id)
end