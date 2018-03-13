User.create!(name:  "Admin", email: "quangnkc2@gmail.com",
  password: "123456", password_confirmation: "123456",
  is_admin: true, status: true, phone: "0123456789", address: "Da Nang", point: 0, avatar: "avt1.jpg")

10.times do |n|
name  = Faker::Name.name
email = "example#{n+1}@gmail.com"
avatar = "avt2.jpg"
User.create!(name:  name, email: email,
  password: "123456", password_confirmation: "123456",
  is_admin: false, status: true, phone: "0123456789", address: "Da Nang", point: 0, avatar: avatar)
end
