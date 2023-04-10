require 'rails_helper'

RSpec.describe 'customers show page' do
  before(:each) do
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
  end

  it 'shows the customer name and a list of their items' do
    visit "/customers/#{@jim.id}"
    # save_and_open_page
    
    expect(page).to have_content("Customer Name: Jim Jimson")
    expect(page).to have_content(@banana.name)
    expect(page).to have_content(@tomato.name)
  end
  
  it 'shows item cost and associated supermarket' do
    visit "/customers/#{@jim.id}"
    # save_and_open_page
    
    expect(page).to have_content(@banana.price)
    expect(page).to have_content(@city_market.name)
  end
  
  it 'has a form to add items to a customer' do
    visit "/customers/#{@jim.id}"
    # save_and_open_page

    fill_in(:name, with: "Orange")
    fill_in(:price, with: 1)
    click_on("Submit")

    expect(page).to have_content(@orange.name)
    expect(page).to have_content(@orange.price)
  end
end