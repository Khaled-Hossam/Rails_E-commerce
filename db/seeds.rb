# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!({email: 'admin@example.com', password: 'password', password_confirmation: 'password'}) if Rails.env.development?

require 'faker'

puts Faker::ChuckNorris.fact
# 10 
categories = [
    'Shoes',
    'Shirts',
    'Hats',
    'Accessories',
    'Electronics',
    'Laptops',
    'Harry Potter',
    'Lord of the Rings',
    'Smart Phones',
    'Others'
]
#8
brands = [
    'WoW',
    'Wilson',
    'Nike',
    '{myBrand}',
    'BMW',
    'Tommy is on Fire',
    'LoL',
    'Others'
]

 ## max_usage_number --> default 1 
#3
coupons = [
    {
        name: "Best Buds",
        expiration_date: Faker::Date.forward(23),
        max_usage_number: 2,
        discount_percentage: 20,
        max_discount_amount: 200
    },
    {
        name: "Big Brother",
        expiration_date: Faker::Date.forward(3),
        max_usage_number: nil,
        discount_percentage: 30,
        max_discount_amount: 500
    },
    {
        name: "Salamy Sandwich",
        expiration_date: nil,
        max_usage_number: 3,
        discount_percentage: 10,
        max_discount_amount: 100
    },
]

#2-> buyers 3 -> sellers
users = [
    {
        email: "seller1@asd.com",
        password: "password",
        password_confirmation: "password",
        role: "seller",
        isActive: true
    },
    {
        email: "seller2@asd.com",
        password: "password",
        password_confirmation: "password",
        role: "seller",
        isActive: true
    },
    {
        email: "seller3@asd.com",
        password: "password",
        password_confirmation: "password",
        role: "seller",
        isActive: true
    },
    {
        email: "seller4@asd.com",
        password: "password",
        password_confirmation: "password",
        role: "seller",
        isActive: true
    },
    {

        email: "seller5@asd.com",
        password: "password",
        password_confirmation: "password",
        role: "seller",
        isActive: false
    },
    {
        email: "seller6@asd.com",
        password: "password",
        password_confirmation: "password",
        role: "seller",
        isActive: false
    },
    {
        email: "buyer1@asd.com",
        password: "password",
        password_confirmation: "password",
    },
    {
        email: "buyer2@asd.com",
        password: "password",
        password_confirmation: "password",
    },
]





users.each do |u|
    User.create(u)
end

categories.each do |c|
    Category.find_or_create_by({name: c}) || Category.create({name: c}) 
end

brands.each do |b|
    Brand.find_or_create_by({name: b}) 
end

#5
assigned_stores = [
    ["Kimo","Electronics shop","1"],
    ["Fino", "Bread and butter shop","2"],
    ["Feino","Mesh la2yino","3"],
]
assigned_stores.each do |s|
    Store.find_or_create_by({name:s[0], summary:s[1], user_id:s[2]})
end

unassigned_stores = [
    ["unassigned store 1","Description","1"],
    ["unassigned store 2", "Description","2"],
    ["unassigned store 3","Description","3"],
]
unassigned_stores.each do |s|
    Store.create!({name:s[0], summary:s[1], user_id: nil})
end

coupons.each do |c|
    Coupon.find_or_create_by(c)
end


10.times {
    Product.find_or_create_by({
        name: Faker::Lorem.word,
        description: Faker::Lorem.sentence,
        price: rand(100..9999),
        instock_quantity: rand(1..5),
        category_id: rand(1..categories.length),
        brand_id: rand(1..brands.length),
        store_id: rand(1..assigned_stores.length)    })
}


# creating orders 

Order.find_or_create_by({
    
})