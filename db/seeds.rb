puts "Seeding eKirtasiye database..."

# Users
[
  { email: "admin@ekirtasiye.com", role: "admin", password: "password123" },
  { email: "school@ekirtasiye.com", role: "school_admin", password: "password123" },
  { email: "customer@ekirtasiye.com", role: "customer", password: "password123" }
].each do |attrs|
  User.find_or_create_by!(email_address: attrs[:email]) do |u|
    u.role = attrs[:role]
    u.password = attrs[:password]
  end
  puts "User: #{attrs[:email]}"
end

# School
school = School.find_or_create_by!(name: "Ataturk Elementary") do |s|
  s.address = "Main St. No:1"
  s.phone = "02121234567"
  s.email = "info@ataturk.k12.tr"
  s.tax_number = "1234567890"
  s.status = :approved
end
puts "School: #{school.name}"

# School Account
SchoolAccount.find_or_create_by!(school: school, user: User.find_by(role: "school_admin")) do |sa|
  sa.responsible_person = "Ahmet Yilmaz"
  sa.phone = "05321234567"
  sa.status = :approved
end
puts "School account created"

# School Point
SchoolPoint.find_or_create_by!(school: school) do |sp|
  sp.balance = 1000
end
puts "School point: #{SchoolPoint.first.balance}"

["Stationery", "Hobby", "Office"].each do |name|
  Category.find_or_create_by!(name: name) do |c|
    c.active = true
  end
end
puts "Categories: #{Category.count}"

# Products
products_list = [
  { sku: "DF001", name: "A4 Notebook 100s", price: 25.50, point: 5, stock: 100, cat: "Stationery" },
  { sku: "DF002", name: "A5 Notebook 80s", price: 18.00, point: 3, stock: 150, cat: "Stationery" },
  { sku: "KL001", name: "HB Pencil", price: 3.50, point: 1, stock: 500, cat: "Stationery" },
  { sku: "KL002", name: "Ballpoint Pen", price: 5.50, point: 1, stock: 400, cat: "Stationery" },
  { sku: "SL001", name: "Eraser", price: 2.00, point: 0, stock: 600, cat: "Stationery" },
  { sku: "CT001", name: "Ruler 30cm", price: 4.50, point: 1, stock: 300, cat: "Stationery" },
  { sku: "BY001", name: "Paint Set 12", price: 35.00, point: 7, stock: 50, cat: "Hobby" },
  { sku: "CN001", name: "School Bag Blue", price: 120.00, point: 24, stock: 30, cat: "Office" }
]

products_list.each do |prod|
  category = Category.find_by(name: prod[:cat])
  Product.find_or_create_by!(sku: prod[:sku]) do |p|
    p.name = prod[:name]
    p.price = prod[:price]
    p.point_value = prod[:point]
    p.stock_quantity = prod[:stock]
    p.category = category
    p.active = true
  end
end
puts "Products: #{Product.count}"

# Classroom
classroom = Classroom.find_or_create_by!(school: school, name: "3-A") do |c|
  c.grade = "3"
  c.section = "A"
  c.active = true
end
puts "Classroom: #{classroom.name}"

# Class List
class_list = SchoolClassList.find_or_create_by!(
  school: school,
  classroom: classroom,
  name: "Grade 3 Semester 1"
) do |cl|
  cl.academic_year = "2025-2026"
  cl.semester = "Semester 1"
  cl.active = true
  cl.version = 1
end
puts "Class list: #{class_list.name}"

# Add products to class list
Product.limit(5).each do |product|
  SchoolClassListItem.find_or_create_by!(
    school_class_list: class_list,
    product: product
  ) do |item|
    item.quantity = rand(2..5)
  end
end
puts "Class list items: #{class_list.school_class_list_items.count}"

# Coupon
CouponCode.find_or_create_by!(code: "WELCOME10") do |c|
  c.discount_type = :percentage
  c.discount_value = 10.0
  c.active = true
  c.valid_until = 1.year.from_now
end
puts "Coupon: WELCOME10"

puts "Seeding completed!"
