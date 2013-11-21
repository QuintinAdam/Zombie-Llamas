# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'ADMIN USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin
puts 'MEMBER PLAYER'
user = User.find_or_create_by_email :name => ENV['MEMBER_NAME'].dup, :email => ENV['MEMBER_EMAIL'].dup, :password => ENV['MEMBER_PASSWORD'].dup, :password_confirmation => ENV['MEMBER_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :VIP
puts 'PLAYER'
user = User.find_or_create_by_email :name => ENV['USER_NAME'].dup, :email => ENV['USER_EMAIL'].dup, :password => ENV['USER_PASSWORD'].dup, :password_confirmation => ENV['USER_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :user