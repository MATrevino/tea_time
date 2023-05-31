require 'rails_helper'

RSpec.describe 'Get All Subscriptions for a Customer' do
  before :each do
    @customer1 = Customer.create!(first_name: "Bob", last_name: "Barker", email: "comeondown@gmail.com", address: "123 Price is Right Lane")
    @tea1 = Tea.create!(title: "Green Tea", description: "Green", temperature: 200, brew_time: 5)
    @tea2 = Tea.create!(title: "Black Tea", description: "Black", temperature: 200, brew_time: 5)
    @subscription1 = Subscription.create!(title: @tea1.title, price: 10, status: 1, frequency: 1, customer_id: @customer1.id, tea_id: @tea1.id)
    @subscription2 = Subscription.create!(title: @tea2.title, price: 10, status: 0, frequency: 1, customer_id: @customer1.id, tea_id: @tea2.id)
  end

  describe 'happy path' do
    it 'can get all subscriptions for a customer' do
      get "/api/v1/customers/#{@customer1[:id]}/subscriptions"

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end
end