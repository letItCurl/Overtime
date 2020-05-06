# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def status
    status_map={
        0 => "submitted",
        1 => "approved",
        2 => "rejected"
    }
    status_map[rand(0..2.5).floor]
end

user = User.create!(email: "bot@mail.com", password: "123456789", password_confirmation: "123456789", last_name: "bot", first_name:"bot")

puts "User created:"
puts "mail: bot@mail.com"
puts "password: 123456789"

admin = AdminUser.create!(email: "admin@mail.com", password: "123456789", password_confirmation: "123456789", last_name: "admin", first_name:"admin")

puts "Admin created:"
puts "mail: admin@mail.com"
puts "password: 123456789"



100.times do |p|
    Post.create!(date: Date.today, rationale: "#{p} rationale content", user_id: user.id, overtime_request: 0.1+p/15, status: status)
end
puts "100 user's post created"

100.times do |p|
    Post.create!(date: Date.today, rationale: "#{p} rationale content", user_id: admin.id, overtime_request: 0.1+p/15, status: status)
end

puts "100 admin's post created"
