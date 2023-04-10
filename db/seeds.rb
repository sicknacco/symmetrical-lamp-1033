# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Supermarket.destroy_all
Item.destroy_all
Customer.destroy_all
CustomersItem.destroy_all

@city_market = Supermarket.create!(name: "City Market", location: "123 Food St.")
@vons = Supermarket.create!(name: "Vons", location: "4525 32nd St.")
@albertsons = Supermarket.create!(name: "Albertsons", location: "682 Elm St.")

@banana = @city_market.items.create!(name: "Banana", price: 2)
@tomato = @city_market.items.create!(name: "Tomato", price: 1)
@kiwi = @vons.items.create!(name: "Kiwi", price: 4)
@orange = @vons.items.create!(name: "Orange", price: 1)
@lemon = @albertsons.items.create!(name: "Lemon", price: 3)
@lettuce = @albertsons.items.create!(name: "Lettuce", price: 5)

@jim = Customer.create!(name: "Jim Jimson")
@bill = Customer.create!(name: "Bill Billards")
@robert = Customer.create!(name: "Robert Bob")
@sara = Customer.create!(name: "Sara Sherman")
@zack = Customer.create!(name: "Zack Williams")
@nick = Customer.create!(name: "Nick Sacco")

@jim_banana = CustomersItem.create!(customer: @jim, item: @banana)
@jim_tomato = CustomersItem.create!(customer: @jim, item: @tomato)
@bill_tomato = CustomersItem.create!(customer: @bill, item: @tomato)
@robert_kiwi = CustomersItem.create!(customer: @robert, item: @kiwi)
@sara_orange = CustomersItem.create!(customer: @sara, item: @orange)
@zack_lemon = CustomersItem.create!(customer: @zack, item: @lemon)
@nick_lettuce = CustomersItem.create!(customer: @nick, item: @lettuce)
@nick_orange = CustomersItem.create!(customer: @nick, item: @orange)
