User.create!(name:  "Quang", email: "quangnkc2@gmail.com",
  password: "123456", password_confirmation: "123456",
  is_admin: false, activated: true, phone: "0123456789", address: "Da Nang", point: 0)

9.times do |n|
name  = Faker::Name.name
email = "example#{n+1}@gmail.com"
User.create!(name:  name, email: email,
  password: "123456", password_confirmation: "123456",
  is_admin: false, activated: true, phone: "0123456789", address: "Da Nang", point: 0)
end
