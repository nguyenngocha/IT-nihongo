puts "create admin"
User.create! name: "admin", role: "admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456"

puts "create user"
User.create! name: "user", role: "user", email: "user@gmail.com",
  password: "123456", password_confirmation: "123456"
