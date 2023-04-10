# Story 1

# As a visitor, 
# When I visit a customer show page,
# I see the customer's name,
# And I see its a list of its items
# including the item's name, price, and the name of the supermarket that it belongs to.
require 'rails_helper'

RSpec.describe 'Customer Show Page', type: :features do
  let!(:customer_1) { Customer.create!(name: 'Billy Bob') }
  let!(:customer_2) { Customer.create!(name: 'Gary Garble') }
  let!(:supermarket_1) { Supermarket.create!(name: 'Piggly Wiggly', location: "Austin, TX") }
  let!(:supermarket_2) { Supermarket.create!(name: 'King Stupor', location: "Denver, CO") }
  let!(:item_1) { supermarket_1.items.create!(name: 'Tofurky Slices', price: 3) }
  let!(:item_2) { supermarket_1.items.create!(name: 'Chao Cheese Slices', price: 5) }

  describe 'displays customer attributes' do
    it 'should display the name of the customer' do
      visit "/customers/#{customer_1.id}"
      expect(page).to have_content(customer_1.name)
    end
    
    it 'should display a list of items, including price, belonging to the customer and where they came from.' do
      visit "/customers/#{customer_1.id}"
      save_and_open_page
      
      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_2.name)
      expect(page).to have_content(item_2.price)
      expect(page).to have_content('Piggly Wiggly')
    end
  end
end