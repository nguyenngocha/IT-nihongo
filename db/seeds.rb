puts "クリエイト　アドミン"
User.create! name: "admin", role: "admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456"
