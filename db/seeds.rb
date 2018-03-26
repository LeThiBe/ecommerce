User.create!(name:  "Be", email: "be@gmail.com",
  password: "123456", password_confirmation: "123456",
  is_admin: false, activated: true, phone: "0123456789", address: "Da Nang", point: 0)

9.times do |n|
  name  = Faker::Name.name
  email = "example#{n+1}@gmail.com"
  User.create!(name:  name, email: email,
    password: "123456", password_confirmation: "123456",
    is_admin: false, activated: true, phone: "0123456789", address: "Da Nang", point: 0)
end

Category.create!(name: "Men")
Category.create!(name: "Women")
Category.create!(name: "Kids")

9.times do |n|
  name  = "category#{n+1}"
  Category.create!(name: name, parent_id: "1")
end

9.times do |n|
  name  = "category#{n+1}"
  Category.create!(name: name, parent_id: "2")
end

cat = Category.order(:created_at).take(5)
5.times do |n|
  name  = Faker::Name.name
  description = Faker::Lorem.sentence(5)
  image = "https://thingsremembered.scene7.com/is/image/ThingsRemembered/000347328?wid=1500"
  cat.each { |category| category.products.create!(name: name, price: "350", size: "30mm", discount: "0", description: description, image: image) }
end

products_id = Product.all.pluck(:id)
products = Product.all
products.each { |product| product.pictures.create!(
  product_id: product.id,
  url_picture: "https://thingsremembered.scene7.com/is/image/ThingsRemembered/000347328?wid=1500"
)}
