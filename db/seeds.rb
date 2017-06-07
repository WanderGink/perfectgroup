# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create! id: 1, name: "food"
Category.create! id: 2, name: "fast"

OrderStatus.create id: 1, name: "In Progress"
OrderStatus.create id: 2, name: "Placed"
OrderStatus.create id: 3, name: "Shipped"
OrderStatus.create id: 4, name: "Cancelled"

User.create id: 1, username: "bui", email: "bui@gmail.com",
  phone_number: "01669206686", password: "123456",
  password_confirmation: "123456", admin: true
User.create id: 2, username: "manh", email: "manh@gmail.com",
  phone_number: "01669206686", password: "123456",
  password_confirmation: "123456"
User.create id: 3, username: "linh", email: "linh@gmail.com",
  phone_number: "01669206686", password: "123456",
  password_confirmation: "123456"
