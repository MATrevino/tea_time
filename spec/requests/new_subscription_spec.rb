require 'rails_helper'

RSpec.describe 'New Subscription' do
  before :each do
    @customer1 = Customer.create!(first_name: "Bob", last_name: "Barker", email: "comeondown@gmail.com", address: "123 Price is Right Lane")
    @tea1 = Tea.create!(title: "Green Tea", description: "Green", temperature: 200, brew_time: 5)
    @tea2 = Tea.create!(title: "Black Tea", description: "Black", temperature: 200, brew_time: 5)
    @subscription1 = Subscription.create!(title: @tea1.title, price: 10, status: 1, frequency: 1, customer_id: @customer1.id, tea_id: @tea1.id)
  end
  describe 'happy path' do
    it 'can create a new subscription' do
      params = {
        title: @tea2.title,
        price: 10,
        status: "active",
        frequency: 1,
        customer_id: @customer1.id,
        tea_id: @tea2.id
      }
      expect(@customer1.subscriptions.count).to eq(1)

      post "/api/v1/customers/#{params[:customer_id]}/subscriptions", params: params
      
      expect(response).to be_successful
      expect(@customer1.subscriptions.count).to eq(2)
      expect(response.status).to eq(201)
    end
  end
end